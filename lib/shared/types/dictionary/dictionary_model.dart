import 'package:json_annotation/json_annotation.dart';

part 'dictionary_model.g.dart';

@JsonSerializable()
class DictionaryModel{
  final String error;
  final bool success;
  final List<ResultModel> result;

  DictionaryModel({
    required this.error,
    required this.success,
    required this.result,
  });

  factory DictionaryModel.fromJson(Map<String, dynamic> json) =>
      _$DictionaryModelFromJson(json);

  Map<String, dynamic> toJson() => _$DictionaryModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class ResultModel{
  final int? id;
  final String? code;
  final String? name;
  @JsonKey(name: 'name_add')
  final String? nameAdd;
  @JsonKey(name: 'city_station')
  final ResultModel? cityStation;
  final int? priority;

  ResultModel({
    required this.id,
    required this.code,
    required this.name,
    required this.nameAdd,
    this.cityStation,
    this.priority
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) =>
      _$ResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResultModelToJson(this);
}
