// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dictionary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DictionaryModel _$DictionaryModelFromJson(Map<String, dynamic> json) =>
    DictionaryModel(
      error: json['error'] as String,
      success: json['success'] as bool,
      result: (json['result'] as List<dynamic>)
          .map((e) => ResultModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DictionaryModelToJson(DictionaryModel instance) =>
    <String, dynamic>{
      'error': instance.error,
      'success': instance.success,
      'result': instance.result,
    };

ResultModel _$ResultModelFromJson(Map<String, dynamic> json) => ResultModel(
      id: json['id'] as int?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      nameAdd: json['name_add'] as String?,
      cityStation: json['city_station'] == null
          ? null
          : ResultModel.fromJson(json['city_station'] as Map<String, dynamic>),
      priority: json['priority'] as int?,
    );

Map<String, dynamic> _$ResultModelToJson(ResultModel instance) {
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
  writeNotNull('priority', instance.priority);
  return val;
}
