part of 'filters_bloc.dart';

@immutable
abstract class FiltersState {}

class FiltersLoadingState extends FiltersState {}

class FiltersDoneState extends FiltersState {
  //final List<CityStationListModel> cities;
  final List<ResultModel> substations;
  final List<ResultModel> cityStations;
  FiltersDoneState({//required this.cities,
    required this.substations, required this.cityStations});
}

class FiltersFailedState extends FiltersState {
  final String message;
  FiltersFailedState({required this.message});
}
class FiltersNetworkErrorState extends FiltersState {
  final String message;
  FiltersNetworkErrorState({required this.message});
}
class FiltersLogoutState extends FiltersState{}