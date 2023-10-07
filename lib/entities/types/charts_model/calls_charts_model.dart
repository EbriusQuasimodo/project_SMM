import 'package:json_annotation/json_annotation.dart';

part 'calls_charts_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CallsChartsModel {
  final String error;
  final bool success;
  @JsonKey(name: 'chart_data')
  final CallsChartDataModel chartData;

  CallsChartsModel({
    required this.error,
    required this.success,
    required this.chartData,
  });

  factory CallsChartsModel.fromJson(Map<String, dynamic> json) =>
      _$CallsChartsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CallsChartsModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CallsChartDataModel {
  final int all;
  final int queue;
  final int transit;
  final int service;
  final int hospitalization;
  @JsonKey(name: 'in_hospital')
  final int inHospital;
  final int result;
  final int archive;

  CallsChartDataModel({
    required this.all,
    required this.queue,
    required this.transit,
    required this.service,
    required this.hospitalization,
    required this.inHospital,
    required this.result,
    required this.archive,
  });

  factory CallsChartDataModel.fromJson(Map<String, dynamic> json) =>
      _$CallsChartDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$CallsChartDataModelToJson(this);
}
