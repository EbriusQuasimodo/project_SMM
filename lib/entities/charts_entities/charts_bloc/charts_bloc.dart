import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_smm/entities/charts_entities/charts_api/repository/brigades_charts_repository.dart';
import 'package:project_smm/entities/charts_entities/charts_api/repository/calls_charts_repository.dart';
import 'package:project_smm/entities/main_page_entities/add_brigades_parameters.dart';
import 'package:project_smm/entities/main_page_entities/add_calls_parameters.dart';
import 'package:project_smm/entities/types/charts_model/brigades_charts_model.dart';
import 'package:project_smm/entities/types/charts_model/calls_charts_model.dart';
import 'package:project_smm/entities/types/parameters_model/params_model.dart';
import 'package:project_smm/shared/lib/errors/failure/failure.dart';

part 'charts_event.dart';

part 'charts_state.dart';

class ChartsBloc extends Bloc<ChartsEvent, ChartsState> {
  ChartsBloc() : super(ChartsUninitialisedState()) {
    BrigadesChartsDataModel? brigadesCharts;
    List<Parameters> callsParametersList = [];
    List<Parameters> brigadesParametersList = [];
    addCallsParameters(callsParametersList);

    addBrigadesParameters(brigadesParametersList);
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
