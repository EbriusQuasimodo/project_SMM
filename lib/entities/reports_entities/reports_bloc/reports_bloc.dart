import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_smm/entities/reports_entities/reports_api/repository/reports_repository.dart';
import 'package:project_smm/entities/types/parameters_model/params_model.dart';
import 'package:project_smm/entities/types/reports_model/reports_model.dart';
import 'package:project_smm/shared/constants/local_storage/local_storage_constants.dart';
import 'package:project_smm/shared/lib/errors/failure/failure.dart';
import 'package:project_smm/shared/lib/local_storage/local_storage.dart';

part 'reports_event.dart';
part 'reports_state.dart';

class ReportsBloc extends Bloc<ReportsEvent, ReportsState> {
  ReportsBloc() : super(ReportsUninitialisedState()) {
    List<Parameters> parametersList = [];
    if (LocalStorage.getList(AppConstants.CITYSTATIONLISTCALLS).isNotEmpty) {
      parametersList.add(Parameters(
          field: 'city_station',
          op: 'in',
          value: LocalStorage.getList(AppConstants.CITYSTATIONLISTCALLS)));
    }
    if (LocalStorage.getList(AppConstants.PRIORITYLISTCALLS).isNotEmpty) {
      parametersList.add(Parameters(
          field: 'priority',
          op: 'in',
          value: LocalStorage.getList(AppConstants.PRIORITYLISTCALLS)));
    }
    if (LocalStorage.getList(AppConstants.SUBSTATIONLISTCALLS).isNotEmpty) {
      parametersList.add(Parameters(
          field: 'substation',
          op: 'in',
          value: LocalStorage.getList(AppConstants.SUBSTATIONLISTCALLS)));
    }

    on<ReportsStartLoadingEvent>((event, emit) async{
      final re = await ReportsRepository.reports(parametersList);
      re.fold((l) {
        if (l is LogOutFailure) {
          emit(ReportsLogoutState());
        } else if (l is ServerFailure) {
          emit(ReportsFailedState(message: l.error));
        }
      }, (r) {
        emit(ReportsDoneState(
          reportsModel: r
        ));
      });
    });
  }
}
