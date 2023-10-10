// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reports_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportsModel _$ReportsModelFromJson(Map<String, dynamic> json) => ReportsModel(
      error: json['error'] as String,
      success: json['success'] as bool,
      today: ReportDataModel.fromJson(json['today'] as Map<String, dynamic>),
      yesterday:
          ReportDataModel.fromJson(json['yesterday'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReportsModelToJson(ReportsModel instance) =>
    <String, dynamic>{
      'error': instance.error,
      'success': instance.success,
      'today': instance.today,
      'yesterday': instance.yesterday,
    };

ReportDataModel _$ReportDataModelFromJson(Map<String, dynamic> json) =>
    ReportDataModel(
      all: json['all'] as int,
      repeats:
          ReportFieldModel.fromJson(json['repeats'] as Map<String, dynamic>),
      withoutTransit: ReportFieldModel.fromJson(
          json['without_transit'] as Map<String, dynamic>),
      withoutResult: ReportFieldModel.fromJson(
          json['without_result'] as Map<String, dynamic>),
      withTransit: WithTransitModel.fromJson(
          json['with_transit'] as Map<String, dynamic>),
      firstPriority: EfficiencyModel.fromJson(
          json['first_priority'] as Map<String, dynamic>),
      secondPriority: EfficiencyModel.fromJson(
          json['second_priority'] as Map<String, dynamic>),
      thirdPriority: EfficiencyModel.fromJson(
          json['third_priority'] as Map<String, dynamic>),
      fourthPriority: EfficiencyModel.fromJson(
          json['fourth_priority'] as Map<String, dynamic>),
      avgHealTime:
          AvgTimeModel.fromJson(json['avg_heal_time'] as Map<String, dynamic>),
      avgArriveTime: AvgTimeModel.fromJson(
          json['avg_arrive_time'] as Map<String, dynamic>),
      transitToMoCalls: TransitToMoCallsModel.fromJson(
          json['transit_to_mo_calls'] as Map<String, dynamic>),
      emergency:
          ReportFieldModel.fromJson(json['emergency'] as Map<String, dynamic>),
      lethal: LethalModel.fromJson(json['lethal'] as Map<String, dynamic>),
      reanimation: ReanimationModel.fromJson(
          json['reanimation'] as Map<String, dynamic>),
      shock: ReportFieldModel.fromJson(json['shock'] as Map<String, dynamic>),
      oks: OksModel.fromJson(json['oks'] as Map<String, dynamic>),
      onmk: OnmkModel.fromJson(json['onmk'] as Map<String, dynamic>),
      pregnancy:
          PregnancyModel.fromJson(json['pregnancy'] as Map<String, dynamic>),
      orvi: ReportFieldModel.fromJson(json['orvi'] as Map<String, dynamic>),
      infection:
          ReportFieldModel.fromJson(json['infection'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReportDataModelToJson(ReportDataModel instance) =>
    <String, dynamic>{
      'all': instance.all,
      'repeats': instance.repeats,
      'without_transit': instance.withoutTransit,
      'without_result': instance.withoutResult,
      'with_transit': instance.withTransit,
      'first_priority': instance.firstPriority,
      'second_priority': instance.secondPriority,
      'third_priority': instance.thirdPriority,
      'fourth_priority': instance.fourthPriority,
      'avg_heal_time': instance.avgHealTime,
      'avg_arrive_time': instance.avgArriveTime,
      'transit_to_mo_calls': instance.transitToMoCalls,
      'emergency': instance.emergency,
      'lethal': instance.lethal,
      'reanimation': instance.reanimation,
      'shock': instance.shock,
      'oks': instance.oks,
      'onmk': instance.onmk,
      'pregnancy': instance.pregnancy,
      'orvi': instance.orvi,
      'infection': instance.infection,
    };

ReportFieldModel _$ReportFieldModelFromJson(Map<String, dynamic> json) =>
    ReportFieldModel(
      value: json['value'] as int,
      percent: json['percent'] as num,
    );

Map<String, dynamic> _$ReportFieldModelToJson(ReportFieldModel instance) =>
    <String, dynamic>{
      'value': instance.value,
      'percent': instance.percent,
    };

WithTransitModel _$WithTransitModelFromJson(Map<String, dynamic> json) =>
    WithTransitModel(
      all: ReportFieldModel.fromJson(json['all'] as Map<String, dynamic>),
      firstThirdPriority: ReportFieldModel.fromJson(
          json['first_third_priority'] as Map<String, dynamic>),
      fourthPriority: ReportFieldModel.fromJson(
          json['fourth_priority'] as Map<String, dynamic>),
      other: ReportFieldModel.fromJson(json['other'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WithTransitModelToJson(WithTransitModel instance) =>
    <String, dynamic>{
      'all': instance.all,
      'first_third_priority': instance.firstThirdPriority,
      'fourth_priority': instance.fourthPriority,
      'other': instance.other,
    };

EfficiencyModel _$EfficiencyModelFromJson(Map<String, dynamic> json) =>
    EfficiencyModel(
      all: ReportFieldModel.fromJson(json['all'] as Map<String, dynamic>),
      efficiency:
          ReportFieldModel.fromJson(json['efficiency'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EfficiencyModelToJson(EfficiencyModel instance) =>
    <String, dynamic>{
      'all': instance.all,
      'efficiency': instance.efficiency,
    };

AvgTimeModel _$AvgTimeModelFromJson(Map<String, dynamic> json) => AvgTimeModel(
      value: json['value'] as num,
      polyclinicValue: json['polyclinic_value'] as num,
      noPolyclinicValue: json['no_polyclinic_value'] as num,
    );

Map<String, dynamic> _$AvgTimeModelToJson(AvgTimeModel instance) =>
    <String, dynamic>{
      'value': instance.value,
      'polyclinic_value': instance.polyclinicValue,
      'no_polyclinic_value': instance.noPolyclinicValue,
    };

TransitToMoCallsModel _$TransitToMoCallsModelFromJson(
        Map<String, dynamic> json) =>
    TransitToMoCallsModel(
      all: ReportFieldModel.fromJson(json['all'] as Map<String, dynamic>),
      hospitalization: ReportFieldModel.fromJson(
          json['hospitalization'] as Map<String, dynamic>),
      help: ReportFieldModel.fromJson(json['help'] as Map<String, dynamic>),
      other: ReportFieldModel.fromJson(json['other'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TransitToMoCallsModelToJson(
        TransitToMoCallsModel instance) =>
    <String, dynamic>{
      'all': instance.all,
      'hospitalization': instance.hospitalization,
      'help': instance.help,
      'other': instance.other,
    };

LethalModel _$LethalModelFromJson(Map<String, dynamic> json) => LethalModel(
      all: ReportFieldModel.fromJson(json['all'] as Map<String, dynamic>),
      beforeSmp:
          ReportFieldModel.fromJson(json['before_smp'] as Map<String, dynamic>),
      afterSmp:
          ReportFieldModel.fromJson(json['after_smp'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LethalModelToJson(LethalModel instance) =>
    <String, dynamic>{
      'all': instance.all,
      'before_smp': instance.beforeSmp,
      'after_smp': instance.afterSmp,
    };

ReanimationModel _$ReanimationModelFromJson(Map<String, dynamic> json) =>
    ReanimationModel(
      all: ReportFieldModel.fromJson(json['all'] as Map<String, dynamic>),
      success:
          ReportFieldModel.fromJson(json['success'] as Map<String, dynamic>),
      failed: ReportFieldModel.fromJson(json['failed'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReanimationModelToJson(ReanimationModel instance) =>
    <String, dynamic>{
      'all': instance.all,
      'success': instance.success,
      'failed': instance.failed,
    };

OksModel _$OksModelFromJson(Map<String, dynamic> json) => OksModel(
      all: ReportFieldModel.fromJson(json['all'] as Map<String, dynamic>),
      withUpSt:
          ReportFieldModel.fromJson(json['with_up_st'] as Map<String, dynamic>),
      withoutUpSt: ReportFieldModel.fromJson(
          json['without_up_st'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OksModelToJson(OksModel instance) => <String, dynamic>{
      'all': instance.all,
      'with_up_st': instance.withUpSt,
      'without_up_st': instance.withoutUpSt,
    };

OnmkModel _$OnmkModelFromJson(Map<String, dynamic> json) => OnmkModel(
      all: ReportFieldModel.fromJson(json['all'] as Map<String, dynamic>),
      lt40Min:
          ReportFieldModel.fromJson(json['lt_40_min'] as Map<String, dynamic>),
      gt40Min:
          ReportFieldModel.fromJson(json['gt_40_min'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OnmkModelToJson(OnmkModel instance) => <String, dynamic>{
      'all': instance.all,
      'lt_40_min': instance.lt40Min,
      'gt_40_min': instance.gt40Min,
    };

PregnancyModel _$PregnancyModelFromJson(Map<String, dynamic> json) =>
    PregnancyModel(
      all: ReportFieldModel.fromJson(json['all'] as Map<String, dynamic>),
      hospitalizationRefuse: ReportFieldModel.fromJson(
          json['hospitalization_refuse'] as Map<String, dynamic>),
      eclampsia:
          ReportFieldModel.fromJson(json['eclampsia'] as Map<String, dynamic>),
      home: ReportFieldModel.fromJson(json['home'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PregnancyModelToJson(PregnancyModel instance) =>
    <String, dynamic>{
      'all': instance.all,
      'hospitalization_refuse': instance.hospitalizationRefuse,
      'eclampsia': instance.eclampsia,
      'home': instance.home,
    };
