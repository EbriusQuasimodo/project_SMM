part of 'favourites_bloc.dart';

@immutable
abstract class FavouritesEvent {}
class FavouritesPageStartLoadingEvent extends FavouritesEvent{
  final bool shouldLoadMore;
  FavouritesPageStartLoadingEvent({required this.shouldLoadMore,});
}

class FavouritesPageDeleteEvent extends FavouritesEvent{
  final String? whatDelete;
  final int? id;
  FavouritesPageDeleteEvent({this.id, this.whatDelete});
}