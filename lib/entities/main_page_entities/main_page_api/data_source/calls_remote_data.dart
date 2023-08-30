import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:project_smm/entities/types/calls_model/calls_model.dart';
import 'package:project_smm/shared/constants/errors_constants/errors_constants.dart';
import 'package:project_smm/shared/lib/errors/exceptions/exceptions.dart';

class CallsData {
  http.Client client = http.Client();

  Future<CallsModel> fetch() async {
    try {
      var re = await client.post(Uri.http('smart103ala.kz','/sd_mobile/api/login'),
          headers: {
            'Content-Type': "application/json"
          },
          );
      print(re.statusCode);
      if(re.statusCode == 200){
        final CallsModel body = CallsModel.fromJson(jsonDecode(utf8.decode(re.bodyBytes)));
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
