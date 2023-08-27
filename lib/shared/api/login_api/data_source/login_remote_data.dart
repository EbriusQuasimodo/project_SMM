import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:project_smm/entities/types/login_model/login_model.dart';
import 'package:project_smm/shared/constants/errors_constants/errors_constants.dart';
import 'package:project_smm/shared/lib/errors/exceptions/exceptions.dart';

class LoginData {
  http.Client client = http.Client();

  Future<LoginModel> fetch(LoginParams params) async {
    try {
      var re = await client.post(Uri.http('smart103ala.kz','/sd_mobile/api/login'),
          headers: {
            'Content-Type': "application/json"
          },
          body: jsonEncode({'login': params.login, 'password': params.password}));
      print(re.statusCode);
      if(re.statusCode == 200){
        final LoginModel body = LoginModel.fromJson(jsonDecode(utf8.decode(re.bodyBytes)));
      return body;
     }else if(re.statusCode == 400){
        throw UnAuthException(message: Errors.wrongLoginOrPassword);
      } else{
       throw ServerException(message: Errors.criticalServerErrorTitle);
     }
    }on SocketException catch(_){
      throw ConnectException(message: Errors.connectionFailed);
    } catch(_){
      rethrow;
    }
  }
}
class LoginParams{
  final String login;
  final String password;
  LoginParams({required this.login, required this.password});
}
