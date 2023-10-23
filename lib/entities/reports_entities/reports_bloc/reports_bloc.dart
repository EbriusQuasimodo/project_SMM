
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_smm/entities/main_page_entities/add_calls_parameters.dart';
import 'package:project_smm/entities/reports_entities/lib/get_report_list.dart';
import 'package:project_smm/entities/reports_entities/reports_api/repository/reports_repository.dart';
import 'package:project_smm/entities/reports_entities/types/structure_report_table.dart';
import 'package:project_smm/entities/types/parameters_model/params_model.dart';
import 'package:project_smm/shared/lib/errors/failure/failure.dart';

part 'reports_event.dart';
part 'reports_state.dart';

class ReportsBloc extends Bloc<ReportsEvent, ReportsState> {
  ReportsBloc() : super(ReportsUninitialisedState()) {
    List<Parameters> parametersList = [];
    addCallsParameters(parametersList);

    on<ReportsStartLoadingEvent>((event, emit) async{
      emit(ReportsStartLoadingState());
      final re = await ReportsRepository.reports(parametersList);
      re.fold((l) {
        if (l is LogOutFailure) {
          emit(ReportsLogoutState());
        } else if (l is ServerFailure) {
          emit(ReportsFailedState(message: l.error));
        }
      }, (r) {
        List<StructureReportTable>? report = getReportList(r);
        emit(ReportsDoneState(
          report: report,
        ));
      });
    });
  }
}
