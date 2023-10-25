import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:project_smm/entities/types/login_model/login_model.dart';
import 'package:project_smm/shared/constants/errors_constants/errors_constants.dart';
import 'package:project_smm/shared/constants/local_storage/local_storage_constants.dart';
import 'package:project_smm/shared/lib/errors/exceptions/exceptions.dart';
import 'package:project_smm/shared/lib/local_storage/local_storage.dart';

class ChangePasswordData {
  http.Client client = http.Client();

  Future<LoginModel> fetch(ChangePasswordParams params) async {
    try {
      var re = await client.put(Uri.http('smart103ala.kz','/sd_mobile/api/user/password'),
          headers: {
            'Authorization': LocalStorage.getString(AppConstants.TOKEN),
            'Content-Type': "application/json"
          },
          body: jsonEncode({'old_password': params.oldPassword, 'new_password': params.newPassword}));
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
class ChangePasswordParams{
  final String oldPassword;
  final String newPassword;
  ChangePasswordParams({required this.oldPassword, required this.newPassword});
}
