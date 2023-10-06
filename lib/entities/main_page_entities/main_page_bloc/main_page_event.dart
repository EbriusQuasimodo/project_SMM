part of 'main_page_bloc.dart';

@immutable
abstract class MainPageEvent {}

class MainPageStartLoadingEvent extends MainPageEvent{
  final bool shouldLoadMore;
  final List<String> callsStatus;
  final List<String> brigadesStatus;
  MainPageStartLoadingEvent({required this.shouldLoadMore, required this.brigadesStatus, required this.callsStatus});
}
class MainPageBrigadesStartLoadingEvent extends MainPageEvent{}
