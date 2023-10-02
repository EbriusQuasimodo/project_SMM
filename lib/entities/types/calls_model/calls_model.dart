import 'package:json_annotation/json_annotation.dart';

part 'calls_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CallsModel {
  final String error;
  final bool success;
  final List<CallsListModel>? calls;
  @JsonKey(name: 'all_count')
  final int allCount;

  CallsModel({
    required this.error,
    required this.success,
    required this.calls,
    required this.allCount,
  });

  factory CallsModel.fromJson(Map<String, dynamic> json) =>
      _$CallsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CallsModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
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
  final String? street2;
  final String house;
  final String? apartment;
  @JsonKey(name: 'patient_info')
  final String? patientInfo;
  final CityModel? city;
  final ReasonModel? reason;
  final SubstationsCallsModel? substation;
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
    required this.patientInfo,
    required this.city,
    required this.reason,
    required this.substation,
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

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class SubstationsCallsModel {
  final int? id;
  final String? code;
  final String? name;
  @JsonKey(name: 'name_add')
  final String? nameAdd;
  @JsonKey(name: 'city_station')
  final CityStationCallsModel? cityStation;

  SubstationsCallsModel({
    required this.id,
    required this.code,
    required this.name,
    required this.nameAdd,
    required this.cityStation,
  });

  factory SubstationsCallsModel.fromJson(Map<String, dynamic> json) =>
      _$SubstationsCallsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubstationsCallsModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CityStationCallsModel {
  final int id;
  final String code;
  final String name;
  @JsonKey(name: 'name_add')
  final String nameAdd;

  CityStationCallsModel(
      {required this.id,
      required this.code,
      required this.name,
      required this.nameAdd});

  factory CityStationCallsModel.fromJson(Map<String, dynamic> json) =>
      _$CityStationCallsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityStationCallsModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class DutyOutfitModel {
  final BrigadeModel? brigade;
  final BrigadeProfileModel? profile;

  DutyOutfitModel({
    required this.brigade,
    required this.profile,
  });

  factory DutyOutfitModel.fromJson(Map<String, dynamic> json) =>
      _$DutyOutfitModelFromJson(json);

  Map<String, dynamic> toJson() => _$DutyOutfitModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class BrigadeProfileModel {
  final int? id;
  final String? code;
  final String? name;
  @JsonKey(name: 'name_add')
  final String? nameAdd;

  BrigadeProfileModel(
      {required this.id,
      required this.code,
      required this.name,
      required this.nameAdd});

  factory BrigadeProfileModel.fromJson(Map<String, dynamic> json) =>
      _$BrigadeProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$BrigadeProfileModelToJson(this);
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
