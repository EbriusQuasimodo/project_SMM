part of 'favourites_bloc.dart';

@immutable
abstract class FavouritesState {}

class FavouritesPageUninitialisedState extends FavouritesState {}

class FavouritesPageLoadingState extends FavouritesState {}

class FavouritesPageDoneState extends FavouritesState {
  final List<CallsListModel>? calls;
  final int allCountCalls;
  final List<BrigadesListModel>? brigades;
  final int allCountBrigades;

  FavouritesPageDoneState({required this.calls, required this.brigades, required this.allCountCalls, required this.allCountBrigades,});
}


class FavouritesPageFailedState extends FavouritesState {
  final String message;

  FavouritesPageFailedState({required this.message});
}

class FavouritesPageNetworkErrorState extends FavouritesState {
  final String message;

  FavouritesPageNetworkErrorState({required this.message});
}

class FavouritesPageLogoutState extends FavouritesState {}


