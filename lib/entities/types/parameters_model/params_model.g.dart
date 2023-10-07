// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'params_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParamsModel _$ParamsModelFromJson(Map<String, dynamic> json) => ParamsModel(
      parameters: (json['parameters'] as List<dynamic>?)
          ?.map((e) => Parameters.fromJson(e as Map<String, dynamic>))
          .toList(),
      limit: json['limit'] as int?,
      offset: json['offset'] as int?,
    );

Map<String, dynamic> _$ParamsModelToJson(ParamsModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('parameters', instance.parameters);
  writeNotNull('limit', instance.limit);
  writeNotNull('offset', instance.offset);
  return val;
}

Parameters _$ParametersFromJson(Map<String, dynamic> json) => Parameters(
      field: json['field'] as String,
      op: json['op'] as String,
      value:
          (json['value'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ParametersToJson(Parameters instance) {
  final val = <String, dynamic>{
    'field': instance.field,
    'op': instance.op,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('value', instance.value);
  return val;
}
