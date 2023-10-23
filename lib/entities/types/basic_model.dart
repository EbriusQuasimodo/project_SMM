class BasicModel{
  BasicModel({
    required String error,
    required bool success,
  }) {
    _error = error;
    _success = success;

  }

  BasicModel.fromJson(dynamic json) {
    _error = json['error'] ?? '';
    _success = json['success'] ?? false;
  }

  String _error = '';
  bool _success = false;


  String get error => _error;

  bool get success => _success;



  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = _error;
    map['success'] = _success;
    return map;
  }
}