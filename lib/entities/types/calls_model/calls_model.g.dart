// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calls_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CallsModel _$CallsModelFromJson(Map<String, dynamic> json) => CallsModel(
      error: json['error'] as String,
      success: json['success'] as bool,
      calls: (json['calls'] as List<dynamic>)
          .map((e) => CallsListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      allCount: json['all_count'] as int,
    );

Map<String, dynamic> _$CallsModelToJson(CallsModel instance) =>
    <String, dynamic>{
      'error': instance.error,
      'success': instance.success,
      'calls': instance.calls,
      'all_count': instance.allCount,
    };

CallsListModel _$CallsListModelFromJson(Map<String, dynamic> json) =>
    CallsListModel(
      id: json['id'] as int,
      dayNumber: json['day_number'] as int,
      yearNumber: json['year_number'] as int,
      receiptDate: json['receipt_date'] as String,
      status: json['status'] as int,
      street: json['street'] as String,
      street2: json['street2'] as String?,
      house: json['house'] as String,
      apartment: json['apartment'] as String?,
      patientInfo: json['patient_info'] as String?,
      city: json['city'] == null
          ? null
          : CityModel.fromJson(json['city'] as Map<String, dynamic>),
      reason: json['reason'] == null
          ? null
          : ReasonModel.fromJson(json['reason'] as Map<String, dynamic>),
      substation: json['substation'] == null
          ? null
          : SubstationsCallsModel.fromJson(
              json['substation'] as Map<String, dynamic>),
      dutyOutfit: json['duty_outfit'] == null
          ? null
          : DutyOutfitModel.fromJson(
              json['duty_outfit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CallsListModelToJson(CallsListModel instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'day_number': instance.dayNumber,
    'year_number': instance.yearNumber,
    'receipt_date': instance.receiptDate,
    'status': instance.status,
    'street': instance.street,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('street2', instance.street2);
  val['house'] = instance.house;
  writeNotNull('apartment', instance.apartment);
  writeNotNull('patient_info', instance.patientInfo);
  writeNotNull('city', instance.city);
  writeNotNull('reason', instance.reason);
  writeNotNull('substation', instance.substation);
  writeNotNull('duty_outfit', instance.dutyOutfit);
  return val;
}

CityModel _$CityModelFromJson(Map<String, dynamic> json) => CityModel(
      id: json['id'] as int,
      code: json['code'] as String,
      name: json['name'] as String,
      nameAdd: json['name_add'] as String,
    );

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'name_add': instance.nameAdd,
    };

ReasonModel _$ReasonModelFromJson(Map<String, dynamic> json) => ReasonModel(
      id: json['id'] as int,
      code: json['code'] as String,
      name: json['name'] as String,
      nameAdd: json['name_add'] as String,
      priority: json['priority'] as int,
    );

Map<String, dynamic> _$ReasonModelToJson(ReasonModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'name_add': instance.nameAdd,
      'priority': instance.priority,
    };

SubstationsCallsModel _$SubstationsCallsModelFromJson(
        Map<String, dynamic> json) =>
    SubstationsCallsModel(
      id: json['id'] as int?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      nameAdd: json['name_add'] as String?,
      cityStation: json['city_station'] == null
          ? null
          : CityStationCallsModel.fromJson(
              json['city_station'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubstationsCallsModelToJson(
    SubstationsCallsModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('code', instance.code);
  writeNotNull('name', instance.name);
  writeNotNull('name_add', instance.nameAdd);
  writeNotNull('city_station', instance.cityStation);
  return val;
}

CityStationCallsModel _$CityStationCallsModelFromJson(
        Map<String, dynamic> json) =>
    CityStationCallsModel(
      id: json['id'] as int,
      code: json['code'] as String,
      name: json['name'] as String,
      nameAdd: json['name_add'] as String,
    );

Map<String, dynamic> _$CityStationCallsModelToJson(
        CityStationCallsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'name_add': instance.nameAdd,
    };

DutyOutfitModel _$DutyOutfitModelFromJson(Map<String, dynamic> json) =>
    DutyOutfitModel(
      brigade: json['brigade'] == null
          ? null
          : BrigadeModel.fromJson(json['brigade'] as Map<String, dynamic>),
      profile: json['profile'] == null
          ? null
          : BrigadeProfileModel.fromJson(
              json['profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DutyOutfitModelToJson(DutyOutfitModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('brigade', instance.brigade);
  writeNotNull('profile', instance.profile);
  return val;
}

BrigadeProfileModel _$BrigadeProfileModelFromJson(Map<String, dynamic> json) =>
    BrigadeProfileModel(
      id: json['id'] as int?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      nameAdd: json['name_add'] as String?,
    );

Map<String, dynamic> _$BrigadeProfileModelToJson(BrigadeProfileModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('code', instance.code);
  writeNotNull('name', instance.name);
  writeNotNull('name_add', instance.nameAdd);
  return val;
}

BrigadeModel _$BrigadeModelFromJson(Map<String, dynamic> json) => BrigadeModel(
      id: json['id'] as int?,
      number: json['number'] as String?,
      substationId: json['substation_id'] as int?,
    );

Map<String, dynamic> _$BrigadeModelToJson(BrigadeModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('number', instance.number);
  writeNotNull('substation_id', instance.substationId);
  return val;
}
