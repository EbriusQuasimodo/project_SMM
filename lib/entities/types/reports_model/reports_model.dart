import 'package:json_annotation/json_annotation.dart';

part 'reports_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class ReportsModel {
  final String error;
  final bool success;
  final ReportDataModel? today;
  final ReportDataModel? yesterday;

  ReportsModel({
    required this.error,
    required this.success,
    required this.today,
    required this.yesterday,
  });

  factory ReportsModel.fromJson(Map<String, dynamic> json) =>
      _$ReportsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReportsModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class ReportDataModel {
  final int all;
  final ReportFieldModel repeats;
  @JsonKey(name: 'without_transit')
  final ReportFieldModel withoutTransit;
  @JsonKey(name: 'without_result')
  final ReportFieldModel withoutResult;
  @JsonKey(name: 'with_transit')
  final WithTransitModel withTransit;
  @JsonKey(name: 'first_priority')
  final EfficiencyModel firstPriority;
  @JsonKey(name: 'second_priority')
  final EfficiencyModel secondPriority;
  @JsonKey(name: 'third_priority')
  final EfficiencyModel thirdPriority;
  @JsonKey(name: 'fourth_priority')
  final EfficiencyModel fourthPriority;
  @JsonKey(name: 'avg_heal_time')
  final AvgTimeModel avgHealTime;
  @JsonKey(name: 'avg_arrive_time')
  final AvgTimeModel avgArriveTime;
  @JsonKey(name: 'transit_to_mo_calls')
  final TransitToMoCallsModel transitToMoCalls;
  final ReportFieldModel emergency;
  final LethalModel lethal;
  final ReanimationModel reanimation;
  final ReportFieldModel shock;
  final OksModel oks;
  final OnmkModel onmk;
  final PregnancyModel pregnancy;
  final ReportFieldModel orvi;
  final ReportFieldModel infection;

  ReportDataModel({
    required this.all,
    required this.repeats,
    required this.withoutTransit,
    required this.withoutResult,
    required this.withTransit,
    required this.firstPriority,
    required this.secondPriority,
    required this.thirdPriority,
    required this.fourthPriority,
    required this.avgHealTime,
    required this.avgArriveTime,
    required this.transitToMoCalls,
    required this.emergency,
    required this.lethal,
    required this.reanimation,
    required this.shock,
    required this.oks,
    required this.onmk,
    required this.pregnancy,
    required this.orvi,
    required this.infection,
  });

  factory ReportDataModel.fromJson(Map<String, dynamic> json) =>
      _$ReportDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReportDataModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class ReportFieldModel {
  final int value;
  final num percent;

  ReportFieldModel({
    required this.value,
    required this.percent,
  });

  factory ReportFieldModel.fromJson(Map<String, dynamic> json) =>
      _$ReportFieldModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReportFieldModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class WithTransitModel {
  final ReportFieldModel all;
  final ReportFieldModel firstThirdPriority;
  final ReportFieldModel fourthPriority;
  final ReportFieldModel other;

  WithTransitModel({
    required this.all,
    required this.firstThirdPriority,
    required this.fourthPriority,
    required this.other,
  });

  factory WithTransitModel.fromJson(Map<String, dynamic> json) =>
      _$WithTransitModelFromJson(json);

  Map<String, dynamic> toJson() => _$WithTransitModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class EfficiencyModel {
  final ReportFieldModel all;
  final ReportFieldModel efficiency;

  EfficiencyModel({
    required this.all,
    required this.efficiency,
  });

  factory EfficiencyModel.fromJson(Map<String, dynamic> json) =>
      _$EfficiencyModelFromJson(json);

  Map<String, dynamic> toJson() => _$EfficiencyModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class AvgTimeModel {
  final num value;
  @JsonKey(name: 'polyclinic_value')
  final num polyclinicValue;
  @JsonKey(name: 'no_polyclinic_value')
  final num noPolyclinicValue;

  AvgTimeModel({
    required this.value,
    required this.polyclinicValue,
    required this.noPolyclinicValue,
  });

  factory AvgTimeModel.fromJson(Map<String, dynamic> json) =>
      _$AvgTimeModelFromJson(json);

  Map<String, dynamic> toJson() => _$AvgTimeModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class TransitToMoCallsModel {
  final ReportFieldModel all;
  final ReportFieldModel hospitalization;
  final ReportFieldModel help;
  final ReportFieldModel other;

  TransitToMoCallsModel({
    required this.all,
    required this.hospitalization,
    required this.help,
    required this.other,
  });

  factory TransitToMoCallsModel.fromJson(Map<String, dynamic> json) =>
      _$TransitToMoCallsModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransitToMoCallsModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class LethalModel {
  final ReportFieldModel all;
  @JsonKey(name: 'before_smp')
  final ReportFieldModel beforeSmp;
  @JsonKey(name: 'after_smp')
  final ReportFieldModel afterSmp;

  LethalModel({
    required this.all,
    required this.beforeSmp,
    required this.afterSmp,
  });

  factory LethalModel.fromJson(Map<String, dynamic> json) =>
      _$LethalModelFromJson(json);

  Map<String, dynamic> toJson() => _$LethalModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class ReanimationModel {
  final ReportFieldModel all;
  final ReportFieldModel success;
  final ReportFieldModel failed;

  ReanimationModel({
    required this.all,
    required this.success,
    required this.failed,
  });

  factory ReanimationModel.fromJson(Map<String, dynamic> json) =>
      _$ReanimationModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReanimationModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class OksModel {
  final ReportFieldModel all;
  @JsonKey(name: 'with_up_st')
  final ReportFieldModel withUpSt;
  @JsonKey(name: 'without_up_st')
  final ReportFieldModel withoutUpSt;

  OksModel({
    required this.all,
    required this.withUpSt,
    required this.withoutUpSt,
  });

  factory OksModel.fromJson(Map<String, dynamic> json) =>
      _$OksModelFromJson(json);

  Map<String, dynamic> toJson() => _$OksModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class OnmkModel {
  final ReportFieldModel all;
  @JsonKey(name: 'lt_40_min')
  final ReportFieldModel lt40Min;
  @JsonKey(name: 'gt_40_min')
  final ReportFieldModel gt40Min;

  OnmkModel({
    required this.all,
    required this.lt40Min,
    required this.gt40Min,
  });

  factory OnmkModel.fromJson(Map<String, dynamic> json) =>
      _$OnmkModelFromJson(json);

  Map<String, dynamic> toJson() => _$OnmkModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class PregnancyModel {
  final ReportFieldModel all;
  @JsonKey(name: 'hospitalization_refuse')
  final ReportFieldModel hospitalizationRefuse;
  final ReportFieldModel eclampsia;
  final ReportFieldModel home;

  PregnancyModel({
    required this.all,
    required this.hospitalizationRefuse,
    required this.eclampsia,
    required this.home,
  });

  factory PregnancyModel.fromJson(Map<String, dynamic> json) =>
      _$PregnancyModelFromJson(json);

  Map<String, dynamic> toJson() => _$PregnancyModelToJson(this);
}
