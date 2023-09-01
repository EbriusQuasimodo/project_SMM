part of 'main_page_bloc.dart';

@immutable
abstract class MainPageState {}

class MainPageLoadingState extends MainPageState {}

class MainPageCallsDoneState extends MainPageState {
  final List<CallsListModel> calls;
  MainPageCallsDoneState({required this.calls});
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
class MainPageLogoutState extends MainPageState{}

