import 'package:json_annotation/json_annotation.dart';

part 'statuses_model.g.dart';

@JsonSerializable(includeIfNull: false)
class StatusesModel {
  List<StatusesList> statusesList;

  StatusesModel({required this.statusesList});

  factory StatusesModel.fromJson(Map<String, dynamic> json) =>
      _$StatusesModelFromJson(json);

  Map<String, dynamic> toJson() => _$StatusesModelToJson(this);
}
@JsonSerializable(includeIfNull: false)
class StatusesList {
  String statusName;
  int? statusId;

  StatusesList({this.statusId, required this.statusName});

  factory StatusesList.fromJson(Map<String, dynamic> json) =>
      _$StatusesListFromJson(json);

  Map<String, dynamic> toJson() => _$StatusesListToJson(this);
}
