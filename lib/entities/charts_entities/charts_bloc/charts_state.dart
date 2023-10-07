part of 'charts_bloc.dart';

@immutable
abstract class ChartsState {}

class ChartsUninitialisedState extends ChartsState {}

class ChartsStartLoadingState extends ChartsState{}

class ChartsDoneState extends ChartsState{
  final CallsChartDataModel callsChartsModel;
  final BrigadesChartsDataModel brigadesChartsModel;

  ChartsDoneState({required this.callsChartsModel, required this.brigadesChartsModel});
}

class ChartsFailedState extends ChartsState {
  final String message;

  ChartsFailedState({required this.message});
}

class ChartsNetworkErrorState extends ChartsState {
  final String message;

  ChartsNetworkErrorState({required this.message});
}

class ChartsLogoutState extends ChartsState {}
