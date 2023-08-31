part of 'main_page_bloc.dart';

@immutable
abstract class MainPageState {}

class MainPageLoadingState extends MainPageState {}

class MainPageDoneState extends MainPageState {
  final List<CallsListModel> calls;
  MainPageDoneState({required this.calls});
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

