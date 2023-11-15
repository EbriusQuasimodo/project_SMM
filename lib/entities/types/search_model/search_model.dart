class SearchModel {
  int numberCalls;
  String fio;
  String street;
  String house;
  String apartment;
  String numberBrigades;
  List<int> profile;

  SearchModel({
    required this.numberCalls,
    required this.fio,
    required this.street,
    required this.house,
    required this.numberBrigades,
    required this.profile,
    required this.apartment,
  });
}
