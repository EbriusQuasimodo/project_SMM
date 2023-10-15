part of 'main_page_bloc.dart';

@immutable
abstract class MainPageState {}

class MainPageUninitialisedState extends MainPageState {}

class MainPageLoadingState extends MainPageState {}

class MainPageDoneState extends MainPageState {
  final List<CallsListModel>? calls;
  final int allCountCalls;
  final List<BrigadesListModel>? brigades;
  final int allCountBrigades;
  List<StatusesList> callsStatusesList;
  List<StatusesList> brigadesStatusesList;

  MainPageDoneState(
      {required this.brigadesStatusesList, required this.callsStatusesList, required this.calls, required this.brigades, required this.allCountCalls, required this.allCountBrigades,});
}

class MainPageBrigadesDoneState extends MainPageState {
  final List<BrigadesListModel> brigades;

  MainPageBrigadesDoneState({required this.brigades});
}

class MainPageFailedState extends MainPageState {
  final String message;

  MainPageFailedState({required this.message});
}

class MainPageNetworkErrorState extends MainPageState {
  final String message;

  MainPageNetworkErrorState({required this.message});
}

class MainPageLogoutState extends MainPageState {}


