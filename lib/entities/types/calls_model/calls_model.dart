import 'package:json_annotation/json_annotation.dart';

part 'calls_model.g.dart';

@JsonSerializable()
class CallsModel {
  final String error;
  final bool success;
  final List<CallsListModel> calls;

  CallsModel({
    required this.error,
    required this.success,
    required this.calls,
  });

  factory CallsModel.fromJson(Map<String, dynamic> json) =>
      _$CallsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CallsModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class CallsListModel {
  final int id;
  @JsonKey(name: 'day_number')
  final int dayNumber;
  @JsonKey(name: 'year_number')
  final int yearNumber;
  @JsonKey(name: 'receipt_date')
  final String receiptDate;
  final int status;
  final String street;
  final String street2;
  final String house;
  final String apartment;
  final CityModel? city;
  final ReasonModel? reason;
  @JsonKey(name: 'duty_outfit')
  final DutyOutfitModel? dutyOutfit;

  CallsListModel({
    required this.id,
    required this.dayNumber,
    required this.yearNumber,
    required this.receiptDate,
    required this.status,
    required this.street,
    required this.street2,
    required this.house,
    required this.apartment,
    required this.city,
    required this.reason,
    required this.dutyOutfit,
  });

  factory CallsListModel.fromJson(Map<String, dynamic> json) =>
      _$CallsListModelFromJson(json);

  Map<String, dynamic> toJson() => _$CallsListModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class CityModel {
  final int id;
  final String code;
  final String name;
  @JsonKey(name: 'name_add')
  final String nameAdd;

  CityModel(
      {required this.id,
      required this.code,
      required this.name,
      required this.nameAdd});

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ReasonModel {
  final int id;
  final String code;
  final String name;
  @JsonKey(name: 'name_add')
  final String nameAdd;
  final int priority;

  ReasonModel(
      {required this.id,
      required this.code,
      required this.name,
      required this.nameAdd,
      required this.priority});

  factory ReasonModel.fromJson(Map<String, dynamic> json) =>
      _$ReasonModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReasonModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class DutyOutfitModel {
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
  final SubstationModel? substation;
  final CarModel? car;
  final BrigadeProfileModel? profile;
  final PersonModel? leader;
  @JsonKey(name: 'first_helper')
  final PersonModel? firstHelper;
  @JsonKey(name: 'second_helper')
  final PersonModel? secondHelper;
  @JsonKey(name: 'car_driver')
  final PersonModel? carDriver;
  final BrigadeModel? brigade;

  DutyOutfitModel(
      {required this.id,
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
      required this.brigade});

  factory DutyOutfitModel.fromJson(Map<String, dynamic> json) =>
      _$DutyOutfitModelFromJson(json);

  Map<String, dynamic> toJson() => _$DutyOutfitModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class SubstationModel {
  final int id;
  final String code;
  final String name;
  @JsonKey(name: 'name_add')
  final String nameAdd;

  SubstationModel(
      {required this.id,
      required this.code,
      required this.name,
      required this.nameAdd});

  factory SubstationModel.fromJson(Map<String, dynamic> json) =>
      _$SubstationModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubstationModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class CarModel {
  final int id;
  @JsonKey(name: 'government_number')
  final String governmentNumber;
  @JsonKey(name: 'side_number')
  final String sideNumber;

  CarModel(
      {required this.id,
      required this.governmentNumber,
      required this.sideNumber});

  factory CarModel.fromJson(Map<String, dynamic> json) =>
      _$CarModelFromJson(json);

  Map<String, dynamic> toJson() => _$CarModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class BrigadeProfileModel {
  final int id;
  final String code;
  final String name;
  @JsonKey(name: 'name_add')
  final String nameAdd;

  BrigadeProfileModel(
      {required this.id,
      required this.code,
      required this.name,
      required this.nameAdd});

  factory BrigadeProfileModel.fromJson(Map<String, dynamic> json) =>
      _$BrigadeProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$BrigadeProfileModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class PersonModel {
  final int id;
  final String fio;
  final String code;
  @JsonKey(name: 'is_fired')
  final bool isFired;
  final String iin;

  PersonModel(
      {required this.id,
      required this.fio,
      required this.code,
      required this.isFired,
      required this.iin});

  factory PersonModel.fromJson(Map<String, dynamic> json) =>
      _$PersonModelFromJson(json);

  Map<String, dynamic> toJson() => _$PersonModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class BrigadeModel {
  final int id;
  final String number;
  @JsonKey(name: 'substation_id')
  final int substationId;

  BrigadeModel(
      {required this.id, required this.number, required this.substationId});

  factory BrigadeModel.fromJson(Map<String, dynamic> json) =>
      _$BrigadeModelFromJson(json);

  Map<String, dynamic> toJson() => _$BrigadeModelToJson(this);
}
