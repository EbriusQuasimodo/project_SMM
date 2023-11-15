import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable(includeIfNull: false)
class LoginModel {
  String error = '';
  bool success = false;
  UserModel? user;

  LoginModel({
    required this.error,
    required this.success,
    required this.user,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class UserModel {
  int id = 0;
  String login = '';
  @JsonKey(name: 'person_id')
  int personId = 0;
  String token = '';
  @JsonKey(name: 'token_create_at')
  String tokenCreateAt = '';
  PersonModel? person;
  List<SubstationsListModel>? substations = [];

  UserModel({
    required this.id,
    required this.login,
    required this.personId,
    required this.token,
    required this.tokenCreateAt,
    required this.person,
    required this.substations,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class PersonModel {
  int id = 0;
  String fio = '';
  String code = '';
  @JsonKey(name: 'is_fired')
  bool isFired = false;
  String iin = '';

  PersonModel({
    required this.id,
    required this.fio,
    required this.code,
    required this.isFired,
    required this.iin,
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) =>
      _$PersonModelFromJson(json);

  Map<String, dynamic> toJson() => _$PersonModelToJson(this);
}
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class SubstationsListModel {
  int id = 0;
  String code = '';
  String name = '';
  @JsonKey(name: 'name_add')
  String nameAdd = '';

  SubstationsListModel({
    required this.id,
    required this.code,
    required this.name,
    required this.nameAdd,
  });

  factory SubstationsListModel.fromJson(Map<String, dynamic> json) =>
      _$SubstationsListModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubstationsListModelToJson(this);
}
