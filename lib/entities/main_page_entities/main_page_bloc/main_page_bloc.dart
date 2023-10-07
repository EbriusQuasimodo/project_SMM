import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_smm/entities/types/parameters_model/params_model.dart';
import 'package:project_smm/entities/main_page_entities/main_page_api/data_source/types/statuses_model.dart';
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

    List<StatusesList> callsStatusesList = [];
    List<StatusesList> brigadesStatusesList = [];

    callsStatusesList
        .add(StatusesList(statusId: 666, statusName: 'Вcе вызовы'));
    callsStatusesList.add(StatusesList(statusId: 1, statusName: 'В очереди'));
    callsStatusesList
        .add(StatusesList(statusId: 3, statusName: 'Обслуживание'));
    callsStatusesList
        .add(StatusesList(statusId: 4, statusName: 'Транспортировка'));
    callsStatusesList.add(StatusesList(statusId: 6, statusName: 'Стационар'));
    callsStatusesList.add(StatusesList(statusId: 5, statusName: 'Завершено'));

    brigadesStatusesList
        .add(StatusesList(statusId: 667, statusName: 'Вcе бригады'));
    brigadesStatusesList.add(StatusesList(
        statusId: 10, statusName: 'Свободен')); // 0 4 5 10 status number
    brigadesStatusesList
        .add(StatusesList(statusId: 2, statusName: 'Обслуживание'));
    brigadesStatusesList.add(StatusesList(
        statusId: 6, statusName: 'Перерыв')); // 6 7 8 status number

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
      if (event.callsStatus.isNotEmpty && event.callsStatus.contains('666')) {
        callsParametersList.removeWhere((element) => element.field == 'status');
        callsParametersList.add(Parameters(
            field: 'status', op: 'in', value: ['1', '2', '3', '4', '5', '6']));
      } else if (event.callsStatus.isNotEmpty) {
        callsParametersList.removeWhere((element) => element.field == 'status');
        callsParametersList.add(
            Parameters(field: 'status', op: 'in', value: event.callsStatus));
      }

      if (event.brigadesStatus.isNotEmpty &&
          event.brigadesStatus.contains('667')) {
        brigadesParametersList
            .removeWhere((element) => element.field == 'status');
        brigadesParametersList.add(Parameters(
            field: 'status',
            op: 'in',
            value: [
              '0',
              '1',
              '2',
              '3',
              '4',
              '5',
              '6',
              '7',
              '8',
              '9',
              '10',
              '11',
              '12'
            ]));
      } else if (event.brigadesStatus.isNotEmpty &&
          event.brigadesStatus.contains('10')) {
        print('10');
        brigadesParametersList
            .removeWhere((element) => element.field == 'status');
        brigadesParametersList.add(Parameters(
            field: 'status', op: 'in', value: ['0', '4', '5', '10']));
      } else if (event.brigadesStatus.isNotEmpty &&
          event.brigadesStatus.contains('2')) {
        print('2');
        brigadesParametersList
            .removeWhere((element) => element.field == 'status');
        brigadesParametersList.add(
            Parameters(field: 'status', op: 'in', value: event.brigadesStatus));
      } else if (event.brigadesStatus.isNotEmpty &&
          event.brigadesStatus.contains('6')) {
        print('6');
        brigadesParametersList
            .removeWhere((element) => element.field == 'status');
        brigadesParametersList
            .add(Parameters(field: 'status', op: 'in', value: ['6', '7', '8']));
      }
      print("asdasdasdas ${json.encode(brigadesParametersList)}");
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
          emit(MainPageCallsDoneState(
              brigadesStatusesList: brigadesStatusesList,
              callsStatusesList: callsStatusesList,
              calls: r.calls ?? [],
              brigades: brigades ?? [],
              allCountCalls: r.allCount,
              allCountBrigades: brigadesCount));
        });
      } else {
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
          offset: newState.calls!.isEmpty ? 0 : newState.calls!.length,
        ));
        reCalls.fold((l) {
          if (l is LogOutFailure) {
            emit(MainPageLogoutState());
          } else if (l is ServerFailure) {
            emit(MainPageFailedState(message: l.error));
          }
        }, (r) {
          emit(MainPageCallsDoneState(
              brigadesStatusesList: brigadesStatusesList,
              callsStatusesList: callsStatusesList,
              calls: newState.calls! + (r.calls ?? []),
              brigades: newState.brigades! + (brigades ?? []),
              allCountCalls: r.allCount,
              allCountBrigades: brigadesCount));
        });
      }
    });
  }
}
