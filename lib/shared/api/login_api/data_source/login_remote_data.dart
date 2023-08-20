import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_smm/entities/types/login_model/login_model.dart';

class LoginData {
  /// Авторизация пользователя
  http.Client client = http.Client();

  Future<LoginModel> fetch(LoginParams params) async {
   // try {
      var re = await client.post(Uri.http('smart103ala.kz','/sd_mobile/api/login'),
          headers: {
            'Content-Type': "application/json"
          },
          body: jsonEncode({'login': params.login, 'password': params.password}));
   //  if(re.statusCode == 200){
        final LoginModel body = LoginModel.fromJson(jsonDecode(utf8.decode(re.bodyBytes)));
      return body;
     //}
   // } catch (_) {
   //   throw Exception(_);
  // }
    //return null;
  }
}
class LoginParams{
  final String login;
  final String password;
  LoginParams({required this.login, required this.password});
}
