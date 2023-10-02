import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_smm/entities/main_page_entities/main_page_api/data_source/types/params_model.dart';
import 'package:project_smm/entities/main_page_entities/main_page_api/repository/brigade_repository.dart';
import 'package:project_smm/entities/main_page_entities/main_page_api/repository/calls_repository.dart';
import 'package:project_smm/entities/types/brigade_model/brigade_model.dart';
import 'package:project_smm/entities/types/calls_model/calls_model.dart';
import 'package:project_smm/shared/constants/local_storage/local_storage_constants.dart';
import 'package:project_smm/shared/lib/errors/failure/failure.dart';
import 'package:project_smm/shared/lib/local_storage/local_storage.dart';

part 'main_page_event.dart';

part 'main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  MainPageBloc() : super(MainPageUninitialisedState()) {
    List<BrigadesListModel>? brigades = [];
    int brigadesCount = 0;
    List<Parameters> callsParametersList = [];
    List<Parameters> brigadesParametersList = [];

    if (LocalStorage.getList(AppConstants.CITYSTATIONLISTCALLS).isNotEmpty) {
      callsParametersList.add(Parameters(
          field: 'city_station',
          op: 'in',
          value: LocalStorage.getList(AppConstants.CITYSTATIONLISTCALLS)));
    }
    if (LocalStorage.getList(AppConstants.PRIORITYLISTCALLS).isNotEmpty) {
      callsParametersList.add(Parameters(
          field: 'priority',
          op: 'in',
          value: LocalStorage.getList(AppConstants.PRIORITYLISTCALLS)));
    }
    if (LocalStorage.getList(AppConstants.SUBSTATIONLISTCALLS).isNotEmpty) {
      callsParametersList.add(Parameters(
          field: 'substation',
          op: 'in',
          value: LocalStorage.getList(AppConstants.SUBSTATIONLISTCALLS)));
    }

    if (LocalStorage.getList(AppConstants.CITYSTATIONLISTBRIGADES).isNotEmpty) {
      brigadesParametersList.add(Parameters(
          field: 'city_station',
          op: 'in',
          value: LocalStorage.getList(AppConstants.CITYSTATIONLISTBRIGADES)));
    }

    if (LocalStorage.getList(AppConstants.SUBSTATIONLISTBRIGADES).isNotEmpty) {
      brigadesParametersList.add(Parameters(
          field: 'substation',
          op: 'in',
          value: LocalStorage.getList(AppConstants.SUBSTATIONLISTBRIGADES)));
    }

    on<MainPageStartLoadingEvent>((event, emit) async {
      if (state is MainPageUninitialisedState) {
        emit(MainPageLoadingState());
        final reBrigades = await BrigadesRepository.brigades(ParamsModel(
            parameters: brigadesParametersList, limit: 10, offset: 0));
        reBrigades.fold((l) {
          if (l is LogOutFailure) {
            emit(MainPageLogoutState());
          } else if (l is ServerFailure) {
            emit(MainPageFailedState(message: l.error));
          }
        }, (r) {
          brigades = r.brigades;
          brigadesCount = r.allCount;
        });

        final reCalls = await CallsRepository.calls(ParamsModel(
          parameters: callsParametersList,
          limit: 10,
          offset: 0,
        ));
        reCalls.fold((l) {
          if (l is LogOutFailure) {
            emit(MainPageLogoutState());
          } else if (l is ServerFailure) {
            emit(MainPageFailedState(message: l.error));
          }
        }, (r) {
          emit(MainPageCallsDoneState(
              calls: r.calls!,
              brigades: brigades!,
              allCountCalls: r.allCount,
              allCountBrigades: brigadesCount));
        });
      } else if (state is MainPageCallsDoneState) {
        MainPageCallsDoneState newState = state as MainPageCallsDoneState;
        final reBrigades = await BrigadesRepository.brigades(ParamsModel(
            parameters: brigadesParametersList,
            limit: 10,
            offset: newState.brigades == null ? 0 : newState.brigades!.length));
        reBrigades.fold((l) {
          if (l is LogOutFailure) {
            emit(MainPageLogoutState());
          } else if (l is ServerFailure) {
            emit(MainPageFailedState(message: l.error));
          }
        }, (r) {
            brigades = r.brigades;
            brigadesCount = r.allCount;
        });

        final reCalls = await CallsRepository.calls(ParamsModel(
          parameters: callsParametersList,
          limit: 10,
          offset: newState.calls.isEmpty ? 0 : newState.calls.length,
        ));
        reCalls.fold((l) {
          if (l is LogOutFailure) {
            emit(MainPageLogoutState());
          } else if (l is ServerFailure) {
            emit(MainPageFailedState(message: l.error));
          }
        }, (r) {
          emit(MainPageCallsDoneState(
              calls: newState.calls + (r.calls ?? []),
              brigades: newState.brigades! + (brigades ?? []),
              allCountCalls: r.allCount,
              allCountBrigades: brigadesCount));
        });
      }
    });
  }
}
