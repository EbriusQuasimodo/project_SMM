// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calls_charts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CallsChartsModel _$CallsChartsModelFromJson(Map<String, dynamic> json) =>
    CallsChartsModel(
      error: json['error'] as String,
      success: json['success'] as bool,
      chartData: CallsChartDataModel.fromJson(
          json['chart_data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CallsChartsModelToJson(CallsChartsModel instance) =>
    <String, dynamic>{
      'error': instance.error,
      'success': instance.success,
      'chart_data': instance.chartData,
    };

CallsChartDataModel _$CallsChartDataModelFromJson(Map<String, dynamic> json) =>
    CallsChartDataModel(
      all: json['all'] as int,
      queue: json['queue'] as int,
      transit: json['transit'] as int,
      service: json['service'] as int,
      hospitalization: json['hospitalization'] as int,
      inHospital: json['in_hospital'] as int,
      result: json['result'] as int,
      archive: json['archive'] as int,
    );

Map<String, dynamic> _$CallsChartDataModelToJson(
        CallsChartDataModel instance) =>
    <String, dynamic>{
      'all': instance.all,
      'queue': instance.queue,
      'transit': instance.transit,
      'service': instance.service,
      'hospitalization': instance.hospitalization,
      'in_hospital': instance.inHospital,
      'result': instance.result,
      'archive': instance.archive,
    };
