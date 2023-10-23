part of 'main_page_bloc.dart';

@immutable
abstract class MainPageEvent {}

class MainPageStartLoadingEvent extends MainPageEvent{
  final bool shouldLoadMore;
  final List<String> callsStatus;
  final List<String> brigadesStatus;
  MainPageStartLoadingEvent({required this.shouldLoadMore, required this.brigadesStatus, required this.callsStatus});
}
class MainPageAddFavouritesEvent extends MainPageEvent{
  final int? id;
  final String? whatAdd;
  MainPageAddFavouritesEvent({ this.id, this.whatAdd});
}
class MainPageDeleteFavouritesEvent extends MainPageEvent{
  final int? id;
  final String? whatDelete;
  MainPageDeleteFavouritesEvent({ this.id, this.whatDelete});
}