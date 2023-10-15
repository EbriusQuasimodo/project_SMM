part of 'reports_bloc.dart';

@immutable
abstract class ReportsState {}


class ReportsUninitialisedState extends ReportsState {}

class ReportsStartLoadingState extends ReportsState{}

class ReportsDoneState extends ReportsState{
  final List<StructureReportTable> report;

  ReportsDoneState({required this.report,});
}

class ReportsFailedState extends ReportsState {
  final String message;

  ReportsFailedState({required this.message});
}

class ReportsNetworkErrorState extends ReportsState {
  final String message;

  ReportsNetworkErrorState({required this.message});
}

class ReportsLogoutState extends ReportsState {}
