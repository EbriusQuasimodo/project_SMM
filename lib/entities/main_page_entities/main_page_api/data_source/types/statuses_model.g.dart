// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statuses_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatusesModel _$StatusesModelFromJson(Map<String, dynamic> json) =>
    StatusesModel(
      statusesList: (json['statusesList'] as List<dynamic>)
          .map((e) => StatusesList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StatusesModelToJson(StatusesModel instance) =>
    <String, dynamic>{
      'statusesList': instance.statusesList,
    };

StatusesList _$StatusesListFromJson(Map<String, dynamic> json) => StatusesList(
      statusId: json['statusId'] as int?,
      statusName: json['statusName'] as String,
    );

Map<String, dynamic> _$StatusesListToJson(StatusesList instance) {
  final val = <String, dynamic>{
    'statusName': instance.statusName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('statusId', instance.statusId);
  return val;
}
