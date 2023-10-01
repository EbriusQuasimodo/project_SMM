import 'package:json_annotation/json_annotation.dart';

part 'params_model.g.dart';

@JsonSerializable(includeIfNull: false)
class ParamsModel {
  List<Parameters>? parameters;
  int limit = 10;
  int offset = 0;

  ParamsModel({
    required this.parameters,
    required this.limit,
    required this.offset,
  });

  factory ParamsModel.fromJson(Map<String, dynamic> json) =>
      _$ParamsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ParamsModelToJson(this);

}

@JsonSerializable(includeIfNull: false)
class Parameters{
  String field = '';
  String op = '';
  List<String>? value;

  Parameters({required this.field, required this.op, required this.value});

  factory Parameters.fromJson(Map<String, dynamic> json) =>
      _$ParametersFromJson(json);

  Map<String, dynamic> toJson() => _$ParametersToJson(this);
}
