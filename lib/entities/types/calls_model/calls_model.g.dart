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
    );

Map<String, dynamic> _$CallsModelToJson(CallsModel instance) =>
    <String, dynamic>{
      'error': instance.error,
      'success': instance.success,
      'calls': instance.calls,
    };

CallsListModel _$CallsListModelFromJson(Map<String, dynamic> json) =>
    CallsListModel(
      id: json['id'] as int,
      dayNumber: json['day_number'] as int,
      yearNumber: json['year_number'] as int,
      receiptDate: json['receipt_date'] as String,
      status: json['status'] as int,
      street: json['street'] as String,
      street2: json['street2'] as String,
      house: json['house'] as String,
      apartment: json['apartment'] as String,
      city: json['city'] == null
          ? null
          : CityModel.fromJson(json['city'] as Map<String, dynamic>),
      reason: json['reason'] == null
          ? null
          : ReasonModel.fromJson(json['reason'] as Map<String, dynamic>),
      dutyOutfit: json['duty_outfit'] == null
          ? null
          : DutyOutfitModel.fromJson(
              json['duty_outfit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CallsListModelToJson(CallsListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'day_number': instance.dayNumber,
      'year_number': instance.yearNumber,
      'receipt_date': instance.receiptDate,
      'status': instance.status,
      'street': instance.street,
      'street2': instance.street2,
      'house': instance.house,
      'apartment': instance.apartment,
      'city': instance.city,
      'reason': instance.reason,
      'duty_outfit': instance.dutyOutfit,
    };

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

DutyOutfitModel _$DutyOutfitModelFromJson(Map<String, dynamic> json) =>
    DutyOutfitModel(
      id: json['id'] as int,
      shiftStart: json['shift_start'] as String,
      shiftEnd: json['shift_end'] as String,
      status: json['status'] as int,
      isActive: json['is_active'] as bool,
      statusStartTime: json['status_start_time'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      substation: json['substation'] == null
          ? null
          : SubstationModel.fromJson(
              json['substation'] as Map<String, dynamic>),
      car: json['car'] == null
          ? null
          : CarModel.fromJson(json['car'] as Map<String, dynamic>),
      profile: json['profile'] == null
          ? null
          : BrigadeProfileModel.fromJson(
              json['profile'] as Map<String, dynamic>),
      leader: json['leader'] == null
          ? null
          : PersonModel.fromJson(json['leader'] as Map<String, dynamic>),
      firstHelper: json['first_helper'] == null
          ? null
          : PersonModel.fromJson(json['first_helper'] as Map<String, dynamic>),
      secondHelper: json['second_helper'] == null
          ? null
          : PersonModel.fromJson(json['second_helper'] as Map<String, dynamic>),
      carDriver: json['car_driver'] == null
          ? null
          : PersonModel.fromJson(json['car_driver'] as Map<String, dynamic>),
      brigade: json['brigade'] == null
          ? null
          : BrigadeModel.fromJson(json['brigade'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DutyOutfitModelToJson(DutyOutfitModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shift_start': instance.shiftStart,
      'shift_end': instance.shiftEnd,
      'status': instance.status,
      'is_active': instance.isActive,
      'status_start_time': instance.statusStartTime,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'substation': instance.substation,
      'car': instance.car,
      'profile': instance.profile,
      'leader': instance.leader,
      'first_helper': instance.firstHelper,
      'second_helper': instance.secondHelper,
      'car_driver': instance.carDriver,
      'brigade': instance.brigade,
    };

SubstationModel _$SubstationModelFromJson(Map<String, dynamic> json) =>
    SubstationModel(
      id: json['id'] as int,
      code: json['code'] as String,
      name: json['name'] as String,
      nameAdd: json['name_add'] as String,
    );

Map<String, dynamic> _$SubstationModelToJson(SubstationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'name_add': instance.nameAdd,
    };

CarModel _$CarModelFromJson(Map<String, dynamic> json) => CarModel(
      id: json['id'] as int,
      governmentNumber: json['government_number'] as String,
      sideNumber: json['side_number'] as String,
    );

Map<String, dynamic> _$CarModelToJson(CarModel instance) => <String, dynamic>{
      'id': instance.id,
      'government_number': instance.governmentNumber,
      'side_number': instance.sideNumber,
    };

BrigadeProfileModel _$BrigadeProfileModelFromJson(Map<String, dynamic> json) =>
    BrigadeProfileModel(
      id: json['id'] as int,
      code: json['code'] as String,
      name: json['name'] as String,
      nameAdd: json['name_add'] as String,
    );

Map<String, dynamic> _$BrigadeProfileModelToJson(
        BrigadeProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'name_add': instance.nameAdd,
    };

PersonModel _$PersonModelFromJson(Map<String, dynamic> json) => PersonModel(
      id: json['id'] as int,
      fio: json['fio'] as String,
      code: json['code'] as String,
      isFired: json['is_fired'] as bool,
      iin: json['iin'] as String,
    );

Map<String, dynamic> _$PersonModelToJson(PersonModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fio': instance.fio,
      'code': instance.code,
      'is_fired': instance.isFired,
      'iin': instance.iin,
    };

BrigadeModel _$BrigadeModelFromJson(Map<String, dynamic> json) => BrigadeModel(
      id: json['id'] as int,
      number: json['number'] as String,
      substationId: json['substation_id'] as int,
    );

Map<String, dynamic> _$BrigadeModelToJson(BrigadeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'substation_id': instance.substationId,
    };
