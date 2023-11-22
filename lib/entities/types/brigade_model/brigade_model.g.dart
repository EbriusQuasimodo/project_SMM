// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brigade_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrigadesModel _$BrigadesModelFromJson(Map<String, dynamic> json) =>
    BrigadesModel(
      error: json['error'] as String,
      success: json['success'] as bool,
      brigades: (json['brigades'] as List<dynamic>?)
          ?.map((e) => BrigadesListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      allCount: json['all_count'] as int,
    );

Map<String, dynamic> _$BrigadesModelToJson(BrigadesModel instance) {
  final val = <String, dynamic>{
    'error': instance.error,
    'success': instance.success,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('brigades', instance.brigades);
  val['all_count'] = instance.allCount;
  return val;
}

BrigadesListModel _$BrigadesListModelFromJson(Map<String, dynamic> json) =>
    BrigadesListModel(
      id: json['id'] as int,
      shiftStart: json['shift_start'] as String,
      shiftEnd: json['shift_end'] as String,
      status: json['status'] as int,
      isActive: json['is_active'] as bool,
      statusStartTime: json['status_start_time'] as String?,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      substation: json['substation'] == null
          ? null
          : SubstationBrigadeModel.fromJson(
              json['substation'] as Map<String, dynamic>),
      car: json['car'] == null
          ? null
          : CarBrigadeModel.fromJson(json['car'] as Map<String, dynamic>),
      profile: json['profile'] == null
          ? null
          : ProfileBrigadeModel.fromJson(
              json['profile'] as Map<String, dynamic>),
      leader: json['leader'] == null
          ? null
          : ProfileModel.fromJson(json['leader'] as Map<String, dynamic>),
      firstHelper: json['first_helper'] == null
          ? null
          : ProfileModel.fromJson(json['first_helper'] as Map<String, dynamic>),
      secondHelper: json['second_helper'] == null
          ? null
          : ProfileModel.fromJson(
              json['second_helper'] as Map<String, dynamic>),
      carDriver: json['car_driver'] == null
          ? null
          : ProfileModel.fromJson(json['car_driver'] as Map<String, dynamic>),
      brigade: json['brigade'] == null
          ? null
          : BrigadeModel.fromJson(json['brigade'] as Map<String, dynamic>),
      calls: (json['calls'] as List<dynamic>?)
          ?.map(
              (e) => BrigadeCallsListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isFavorite: json['is_favorite'] as bool?,
    );

Map<String, dynamic> _$BrigadesListModelToJson(BrigadesListModel instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'shift_start': instance.shiftStart,
    'shift_end': instance.shiftEnd,
    'status': instance.status,
    'is_active': instance.isActive,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status_start_time', instance.statusStartTime);
  val['latitude'] = instance.latitude;
  val['longitude'] = instance.longitude;
  writeNotNull('substation', instance.substation);
  writeNotNull('car', instance.car);
  writeNotNull('profile', instance.profile);
  writeNotNull('leader', instance.leader);
  writeNotNull('first_helper', instance.firstHelper);
  writeNotNull('second_helper', instance.secondHelper);
  writeNotNull('car_driver', instance.carDriver);
  writeNotNull('brigade', instance.brigade);
  writeNotNull('calls', instance.calls);
  writeNotNull('is_favorite', instance.isFavorite);
  return val;
}

SubstationBrigadeModel _$SubstationBrigadeModelFromJson(
        Map<String, dynamic> json) =>
    SubstationBrigadeModel(
      id: json['id'] as int?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      nameAdd: json['name_add'] as String?,
      cityStation: json['city_station'] == null
          ? null
          : CityStationBrigadeModel.fromJson(
              json['city_station'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubstationBrigadeModelToJson(
    SubstationBrigadeModel instance) {
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

CityStationBrigadeModel _$CityStationBrigadeModelFromJson(
        Map<String, dynamic> json) =>
    CityStationBrigadeModel(
      id: json['id'] as int,
      code: json['code'] as String,
      name: json['name'] as String,
      nameAdd: json['name_add'] as String,
    );

Map<String, dynamic> _$CityStationBrigadeModelToJson(
        CityStationBrigadeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'name_add': instance.nameAdd,
    };

CarBrigadeModel _$CarBrigadeModelFromJson(Map<String, dynamic> json) =>
    CarBrigadeModel(
      id: json['id'] as int,
      governmentNumber: json['government_number'] as String,
      sideNumber: json['side_number'] as String,
    );

Map<String, dynamic> _$CarBrigadeModelToJson(CarBrigadeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'government_number': instance.governmentNumber,
      'side_number': instance.sideNumber,
    };

ProfileBrigadeModel _$ProfileBrigadeModelFromJson(Map<String, dynamic> json) =>
    ProfileBrigadeModel(
      id: json['id'] as int,
      code: json['code'] as String,
      name: json['name'] as String,
      nameAdd: json['name_add'] as String,
    );

Map<String, dynamic> _$ProfileBrigadeModelToJson(
        ProfileBrigadeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'name_add': instance.nameAdd,
    };

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      id: json['id'] as int?,
      fio: json['fio'] as String?,
      code: json['code'] as String?,
      isFired: json['is_fired'] as bool?,
      iin: json['iin'] as String?,
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('fio', instance.fio);
  writeNotNull('code', instance.code);
  writeNotNull('is_fired', instance.isFired);
  writeNotNull('iin', instance.iin);
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

BrigadeCallsListModel _$BrigadeCallsListModelFromJson(
        Map<String, dynamic> json) =>
    BrigadeCallsListModel(
      id: json['id'] as int,
      dayNumber: json['day_number'] as int,
      yearNumber: json['year_number'] as int,
      receiptDate: json['receipt_date'] as String,
      status: json['status'] as int,
      street: json['street'] as String,
      street2: json['street2'] as String?,
      house: json['house'] as String?,
      apartment: json['apartment'] as String?,
      patientInfo: json['patient_info'] as String?,
    );

Map<String, dynamic> _$BrigadeCallsListModelToJson(
    BrigadeCallsListModel instance) {
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
  writeNotNull('house', instance.house);
  writeNotNull('apartment', instance.apartment);
  writeNotNull('patient_info', instance.patientInfo);
  return val;
}
