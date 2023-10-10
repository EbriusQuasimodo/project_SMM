part of 'reports_bloc.dart';

@immutable
abstract class ReportsEvent {}
class ReportsStartLoadingEvent extends ReportsEvent{}

class ReportsLoadedEvent{}