import 'package:json_annotation/json_annotation.dart';

part 'brigade_model.g.dart';

@JsonSerializable()
class BrigadesModel {
  final String error;
  final bool success;
  final List<BrigadesListModel> brigades;

  BrigadesModel({
    required this.error,
    required this.success,
    required this.brigades,
  });

  factory BrigadesModel.fromJson(Map<String, dynamic> json) =>
      _$BrigadesModelFromJson(json);

  Map<String, dynamic> toJson() => _$BrigadesModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class BrigadesListModel {
  final int id;
  @JsonKey(name: 'shift_start')
  final String shiftStart;
  @JsonKey(name: 'shift_end')
  final String shiftEnd;
  final int status;
  @JsonKey(name: 'is_active')
  final bool isActive;
  @JsonKey(name: 'status_start_time')
  final String statusStartTime;
  final double latitude;
  final double longitude;
  final SubstationBrigadeModel? substation;
  final CarBrigadeModel? car;
  final ProfileBrigadeModel? profile;
  final ProfileModel? leader;
  @JsonKey(name: 'first_helper')
  final ProfileModel? firstHelper;
  @JsonKey(name: 'second_helper')
  final ProfileModel? secondHelper;
  @JsonKey(name: 'car_driver')
  final ProfileModel? carDriver;
  final BrigadeModel? brigade;
  final List<BrigadeCallsListModel>? calls;

  BrigadesListModel({
    required this.id,
    required this.shiftStart,
    required this.shiftEnd,
    required this.status,
    required this.isActive,
    required this.statusStartTime,
    required this.latitude,
    required this.longitude,
    required this.substation,
    required this.car,
    required this.profile,
    required this.leader,
    required this.firstHelper,
    required this.secondHelper,
    required this.carDriver,
    required this.brigade,
    required this.calls,
  });

  factory BrigadesListModel.fromJson(Map<String, dynamic> json) =>
      _$BrigadesListModelFromJson(json);

  Map<String, dynamic> toJson() => _$BrigadesListModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class SubstationBrigadeModel {
  final int? id;
  final String? code;
  final String? name;
  @JsonKey(name: 'name_add')
  final String? nameAdd;
  @JsonKey(name: 'city_station')
  final CityStationBrigadeModel? cityStation;

  SubstationBrigadeModel({
    required this.id,
    required this.code,
    required this.name,
    required this.nameAdd,
    required this.cityStation,
  });

  factory SubstationBrigadeModel.fromJson(Map<String, dynamic> json) =>
      _$SubstationBrigadeModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubstationBrigadeModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CityStationBrigadeModel {
  final int id;
  final String code;
  final String name;
  @JsonKey(name: 'name_add')
  final String nameAdd;

  CityStationBrigadeModel(
      {required this.id,
      required this.code,
      required this.name,
      required this.nameAdd});

  factory CityStationBrigadeModel.fromJson(Map<String, dynamic> json) =>
      _$CityStationBrigadeModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityStationBrigadeModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CarBrigadeModel {
  final int id;
  @JsonKey(name: 'government_number')
  final String governmentNumber;
  @JsonKey(name: 'side_number')
  final String sideNumber;

  CarBrigadeModel({
    required this.id,
    required this.governmentNumber,
    required this.sideNumber,
  });

  factory CarBrigadeModel.fromJson(Map<String, dynamic> json) =>
      _$CarBrigadeModelFromJson(json);

  Map<String, dynamic> toJson() => _$CarBrigadeModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class ProfileBrigadeModel {
  final int id;
  final String code;
  final String name;
  @JsonKey(name: 'name_add')
  final String nameAdd;

  ProfileBrigadeModel({
    required this.id,
    required this.code,
    required this.name,
    required this.nameAdd,
  });

  factory ProfileBrigadeModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileBrigadeModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileBrigadeModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class ProfileModel {
  final int? id;
  final String? fio;
  final String? code;
  @JsonKey(name: 'is_fired')
  final bool? isFired;
  final String? iin;

  ProfileModel(
      {required this.id,
      required this.fio,
      required this.code,
      required this.isFired,
      required this.iin});

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class BrigadeModel {
  final int? id;
  final String? number;
  @JsonKey(name: 'substation_id')
  final int? substationId;

  BrigadeModel(
      {required this.id, required this.number, required this.substationId});

  factory BrigadeModel.fromJson(Map<String, dynamic> json) =>
      _$BrigadeModelFromJson(json);

  Map<String, dynamic> toJson() => _$BrigadeModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class BrigadeCallsListModel {
  final int id;
  @JsonKey(name: 'day_number')
  final int dayNumber;
  @JsonKey(name: 'year_number')
  final int yearNumber;
  @JsonKey(name: 'receipt_date')
  final String receiptDate;
  final int status;
  final String street;
  final String? street2;
  final String house;
  final String? apartment;
  @JsonKey(name: 'patient_info')
  final String? patientInfo;

  BrigadeCallsListModel({
    required this.id,
    required this.dayNumber,
    required this.yearNumber,
    required this.receiptDate,
    required this.status,
    required this.street,
    required this.street2,
    required this.house,
    required this.apartment,
    required this.patientInfo,
  });

  factory BrigadeCallsListModel.fromJson(Map<String, dynamic> json) =>
      _$BrigadeCallsListModelFromJson(json);

  Map<String, dynamic> toJson() => _$BrigadeCallsListModelToJson(this);
}
