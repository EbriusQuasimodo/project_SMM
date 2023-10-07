import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_smm/entities/charts_entities/charts_api/repository/brigades_charts_repository.dart';
import 'package:project_smm/entities/charts_entities/charts_api/repository/calls_charts_repository.dart';
import 'package:project_smm/entities/types/charts_model/brigades_charts_model.dart';
import 'package:project_smm/entities/types/charts_model/calls_charts_model.dart';
import 'package:project_smm/entities/types/parameters_model/params_model.dart';
import 'package:project_smm/shared/constants/local_storage/local_storage_constants.dart';
import 'package:project_smm/shared/lib/errors/failure/failure.dart';
import 'package:project_smm/shared/lib/local_storage/local_storage.dart';

part 'charts_event.dart';

part 'charts_state.dart';

class ChartsBloc extends Bloc<ChartsEvent, ChartsState> {
  ChartsBloc() : super(ChartsUninitialisedState()) {
    BrigadesChartsDataModel? brigadesCharts;
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

    on<ChartsStartLoadingEvent>((event, emit) async {
      emit(ChartsStartLoadingState());
      final reChartsBrigades = await BrigadesChartsRepository.brigadesCharts(brigadesParametersList);
      reChartsBrigades.fold((l) {
        if (l is LogOutFailure) {
          emit(ChartsLogoutState());
        } else if (l is ServerFailure) {
          emit(ChartsFailedState(message: l.error));
        }
      }, (r) {
        brigadesCharts = r.chartData;
      });

      final reChartCalls = await CallsChartsRepository.callsCharts(callsParametersList);
      reChartCalls.fold((l) {
        if (l is LogOutFailure) {
          emit(ChartsLogoutState());
        } else if (l is ServerFailure) {
          emit(ChartsFailedState(message: l.error));
        }
      }, (r) {
        emit(ChartsDoneState(
            callsChartsModel: r.chartData,
            brigadesChartsModel: brigadesCharts!));
      });
    });
  }
}
