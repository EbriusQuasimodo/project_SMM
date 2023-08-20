class LoginModel {
  LoginModel({
    required String error,
    required bool success,
    required User? user,
  }) {
    _error = error;
    _success = success;
    _user = user;
  }

  LoginModel.fromJson(dynamic json) {
    _error = json['error'] ?? '';
    _success = json['middle_name'] ?? false;
    _user = json['user'] != null ?User.fromJson(json['user']) :null;
  }

  String _error = '';
  bool _success = false;
  User? _user;

  String get error => _error;

  bool get success => _success;

  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = _error;
    map['success'] = _success;
    if(_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }
}

class User {
  User({
    required int id,
    required String login,
    required int personId,
    required String token,
    required String tokenCreateAt,
    required Person? person,
    required List<Substations> substations,
  }) {
    _id = id;
    _login = login;
    _personId = personId;
    _token = token;
    _tokenCreateAt = tokenCreateAt;
    _person = person;
    _substations = substations;
  }

  User.fromJson(dynamic json) {
    _id = json['id'] ?? '';
    _login = json['login'] ?? '';
    _personId = json['person_id'] ?? '';
    _token = json['token'] ?? '';
    _tokenCreateAt = json['token_create_at'] ?? '';
    _person = json['person'] != null ? Person.fromJson(json['person']) : null;
    _substations = [];
    if (json['substations'] != null) {
      json['substations'].forEach((v) {
        _substations.add(Substations.fromJson(v));
      });
    }
  }

  int _id = 0;
  String _login = '';
  int _personId = 0;
  String _token = '';
  String _tokenCreateAt = '';
  Person? _person;
  List<Substations> _substations = [];

  int get id => _id;

  String get login => _login;

  int get personId => _personId;

  String get token => _token;

  String get tokenCreateAt => _tokenCreateAt;

  Person? get person => _person;

  List<Substations> get substations => _substations;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['login'] = _login;
    map['person_id'] = _personId;
    map['token'] = _token;
    map['token_create_at'] = _tokenCreateAt;
    if (_person != null) {
      map['person'] = _person?.toJson();
    }
    map['substations'] = _substations.map((v) => v.toJson()).toList();
    return map;
  }
}


class Person {
  Person({
    required int id,
    required String fio,
    required String code,
    required bool isFired,
    required String iin,
  }) {
    _id = id;
    _fio = fio;
    _code = code;
    _isFired = isFired;
    _iin = iin;
  }

  Person.fromJson(dynamic json) {
    _id = json['id'] ?? '';
    _fio = json['fio'] ?? '';
    _code = json['code'] ?? '';
    _isFired = json['is_fired'] ?? '';
    _iin = json['iin'] ?? '';
  }

  int _id = 0;
  String _fio = '';
  String _code = '';
  bool _isFired = false;
  String _iin = '';

  int get id => _id;

  String get fio => _fio;

  String get code => _code;

  bool get isFired => _isFired;

  String get iin => _iin;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['fio'] = _fio;
    map['code'] = _code;
    map['is_fired'] = _isFired;
    map['iin'] = _iin;
    return map;
  }
}

class Substations {
  Substations({
    required int id,
    required String code,
    required String name,
    required String nameAdd,
  }) {
    _id = id;
    _code = code;
    _name = name;
    _nameAdd = nameAdd;
  }

  Substations.fromJson(dynamic json) {
    _id = json['id'] ?? '';
    _code = json['code'] ?? '';
    _name = json['name'] ?? '';
    _nameAdd = json['name_add'] ?? '';
  }

  int _id = 0;
  String _code = '';
  String _name = '';
  String _nameAdd = '';

  int get id => _id;

  String get code => _code;

  String get name => _name;

  String get nameAdd => _nameAdd;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['code'] = _code;
    map['name'] = _name;
    map['name_add'] = _nameAdd;
    return map;
  }
}
