import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_smm/entities/favourites_entities/favourites_api/repository/favourites_add_repository.dart';
import 'package:project_smm/entities/favourites_entities/favourites_api/repository/favourites_delete_repository.dart';
import 'package:project_smm/entities/main_page_entities/add_brigades_parameters.dart';
import 'package:project_smm/entities/main_page_entities/add_brigades_statuses.dart';
import 'package:project_smm/entities/main_page_entities/add_calls_parameters.dart';
import 'package:project_smm/entities/main_page_entities/add_calls_statuses.dart';
import 'package:project_smm/entities/types/parameters_model/params_model.dart';
import 'package:project_smm/entities/main_page_entities/main_page_api/data_source/types/statuses_model.dart';
import 'package:project_smm/entities/main_page_entities/main_page_api/repository/brigade_repository.dart';
import 'package:project_smm/entities/main_page_entities/main_page_api/repository/calls_repository.dart';
import 'package:project_smm/entities/types/brigade_model/brigade_model.dart';
import 'package:project_smm/entities/types/calls_model/calls_model.dart';
import 'package:project_smm/entities/types/search_model/search_model.dart';
import 'package:project_smm/shared/lib/errors/failure/failure.dart';

part 'main_page_event.dart';

part 'main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  MainPageBloc() : super(MainPageUninitialisedState()) {
    List<BrigadesListModel>? brigades = [];
    int brigadesCount = 0;
    List<Parameters> callsParametersList = [];
    List<Parameters> brigadesParametersList = [];

    List<StatusesList> callsStatusesList = [];
    List<StatusesList> brigadesStatusesList = [];

    createCallsStatuses(callsStatusesList);

    createBrigadesStatuses(brigadesStatusesList);

    addCallsParameters(callsParametersList);

    addBrigadesParameters(brigadesParametersList);

    on<MainPageStartLoadingEvent>((event, emit) async {
      addSearchBrigadesParameters(brigadesParametersList, event.searchModel);

      addSearchCallsParameters(callsParametersList, event.searchModel);

      addCallsStatusesInParametersList(callsParametersList, event.callsStatus);

      addBrigadesStatusesInParametersList(
          brigadesParametersList, event.brigadesStatus);

      if (!event.shouldLoadMore) {
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
          emit(MainPageDoneState(
              brigadesStatusesList: brigadesStatusesList,
              callsStatusesList: callsStatusesList,
              calls: r.calls ?? [],
              brigades: brigades ?? [],
              allCountCalls: r.allCount,
              allCountBrigades: brigadesCount));
        });
      } else {
        MainPageDoneState newState = state as MainPageDoneState;
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
          offset: newState.calls!.isEmpty ? 0 : newState.calls!.length,
        ));
        reCalls.fold((l) {
          if (l is LogOutFailure) {
            emit(MainPageLogoutState());
          } else if (l is ServerFailure) {
            emit(MainPageFailedState(message: l.error));
          }
        }, (r) {
          emit(MainPageDoneState(
              brigadesStatusesList: brigadesStatusesList,
              callsStatusesList: callsStatusesList,
              calls: newState.calls! + (r.calls ?? []),
              brigades: newState.brigades! + (brigades ?? []),
              allCountCalls: r.allCount,
              allCountBrigades: brigadesCount));
        });
      }
    });
    on<MainPageAddFavouritesEvent>((event, emit) async {
      final re = await FavouritesAddRepository.favouritesAdd(
          event.id!, event.whatAdd!);
      re.fold((l) {
        if (l is LogOutFailure) {
          emit(MainPageLogoutState());
        } else if (l is ServerFailure) {
          emit(MainPageFailedState(message: l.error));
        }
      }, (r) {});
    });
    on<MainPageDeleteFavouritesEvent>((event, emit) async {
      final re = await FavouritesDeleteRepository.favouritesDelete(
          event.id!, event.whatDelete!);
      re.fold((l) {
        if (l is LogOutFailure) {
          emit(MainPageLogoutState());
        } else if (l is ServerFailure) {
          emit(MainPageFailedState(message: l.error));
        }
      }, (r) {});
    });
  }
}
