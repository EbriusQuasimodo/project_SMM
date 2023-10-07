// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brigades_charts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrigadesChartsModel _$BrigadesChartsModelFromJson(Map<String, dynamic> json) =>
    BrigadesChartsModel(
      error: json['error'] as String,
      success: json['success'] as bool,
      chartData: BrigadesChartsDataModel.fromJson(
          json['chart_data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BrigadesChartsModelToJson(
        BrigadesChartsModel instance) =>
    <String, dynamic>{
      'error': instance.error,
      'success': instance.success,
      'chart_data': instance.chartData,
    };

BrigadesChartsDataModel _$BrigadesChartsDataModelFromJson(
        Map<String, dynamic> json) =>
    BrigadesChartsDataModel(
      all: json['all'] as int,
      transit: json['transit'] as int,
      service: json['service'] as int,
      hospitalization: json['hospitalization'] as int,
      inHospital: json['in_hospital'] as int,
      free: json['free'] as int,
      obligatedReturn: json['obligated_return'] as int,
      other: json['other'] as int,
    );

Map<String, dynamic> _$BrigadesChartsDataModelToJson(
        BrigadesChartsDataModel instance) =>
    <String, dynamic>{
      'all': instance.all,
      'transit': instance.transit,
      'service': instance.service,
      'hospitalization': instance.hospitalization,
      'in_hospital': instance.inHospital,
      'free': instance.free,
      'obligated_return': instance.obligatedReturn,
      'other': instance.other,
    };
