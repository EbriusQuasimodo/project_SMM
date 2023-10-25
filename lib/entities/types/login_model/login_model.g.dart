// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      error: json['error'] as String,
      success: json['success'] as bool,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) {
  final val = <String, dynamic>{
    'error': instance.error,
    'success': instance.success,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user', instance.user);
  return val;
}

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as int,
      login: json['login'] as String,
      personId: json['person_id'] as int,
      token: json['token'] as String,
      tokenCreateAt: json['token_create_at'] as String,
      person: json['person'] == null
          ? null
          : PersonModel.fromJson(json['person'] as Map<String, dynamic>),
      substations: (json['substations'] as List<dynamic>)
          .map((e) => SubstationsListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'login': instance.login,
    'person_id': instance.personId,
    'token': instance.token,
    'token_create_at': instance.tokenCreateAt,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('person', instance.person);
  val['substations'] = instance.substations;
  return val;
}

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

SubstationsListModel _$SubstationsListModelFromJson(
        Map<String, dynamic> json) =>
    SubstationsListModel(
      id: json['id'] as int,
      code: json['code'] as String,
      name: json['name'] as String,
      nameAdd: json['name_add'] as String,
    );

Map<String, dynamic> _$SubstationsListModelToJson(
        SubstationsListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'name_add': instance.nameAdd,
    };
