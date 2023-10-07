import 'package:json_annotation/json_annotation.dart';

part 'brigades_charts_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class BrigadesChartsModel {
  final String error;
  final bool success;
  @JsonKey(name: 'chart_data')
  final BrigadesChartsDataModel chartData;

  BrigadesChartsModel({
    required this.error,
    required this.success,
    required this.chartData,
  });

  factory BrigadesChartsModel.fromJson(Map<String, dynamic> json) =>
      _$BrigadesChartsModelFromJson(json);

  Map<String, dynamic> toJson() => _$BrigadesChartsModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class BrigadesChartsDataModel {
  final int all;
  final int transit;
  final int service;
  final int hospitalization;
  @JsonKey(name: 'in_hospital')
  final int inHospital;
  final int free;
  @JsonKey(name: 'obligated_return')
  final int obligatedReturn;
  final int other;

  BrigadesChartsDataModel({
    required this.all,
    required this.transit,
    required this.service,
    required this.hospitalization,
    required this.inHospital,
    required this.free,
    required this.obligatedReturn,
    required this.other,
  });

  factory BrigadesChartsDataModel.fromJson(Map<String, dynamic> json) =>
      _$BrigadesChartsDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$BrigadesChartsDataModelToJson(this);
}
