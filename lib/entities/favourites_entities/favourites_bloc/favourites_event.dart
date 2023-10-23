part of 'favourites_bloc.dart';

@immutable
abstract class FavouritesEvent {}
class FavouritesPageStartLoadingEvent extends FavouritesEvent{
  final bool shouldLoadMore;
  final SearchModel? searchModel;
  FavouritesPageStartLoadingEvent({required this.shouldLoadMore,this.searchModel});
}

class FavouritesPageDeleteEvent extends FavouritesEvent{
  final String? whatDelete;
  final int? id;
  FavouritesPageDeleteEvent({this.id, this.whatDelete});
}