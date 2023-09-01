import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:project_smm/entities/types/brigade_model/brigade_model.dart';
import 'package:project_smm/shared/constants/errors_constants/errors_constants.dart';
import 'package:project_smm/shared/constants/local_storage/local_storage_constants.dart';
import 'package:project_smm/shared/lib/errors/exceptions/exceptions.dart';
import 'package:project_smm/shared/lib/local_storage/local_storage.dart';

class BrigadesData {
  http.Client client = http.Client();

  Future<BrigadesModel> fetch() async {
    try {
      var re = await client.post(
          Uri.http('smart103ala.kz', '/sd_mobile/api/brigades/operative'),
          headers: {
            'Authorization': LocalStorage.getString(AppConstants.TOKEN),
            'Content-Type': "application/json",
          },
          body: json.encode({
            'limit': 10,
            'offset': 0,
            'parameters':[]
          }));
      print(LocalStorage.getString(AppConstants.TOKEN));
      print(re.statusCode);
      if (re.statusCode == 200) {
        final BrigadesModel body =
        BrigadesModel.fromJson(jsonDecode(utf8.decode(re.bodyBytes)));
        return body;
      } else if (re.statusCode == 400) {
        throw UnAuthException(message: Errors.wrongLoginOrPassword);
      } else if (re.statusCode == 401) {
        throw LogOutException(message: Errors.outdatedToken);
      } else {
        throw ServerException(message: Errors.criticalServerErrorTitle);
      }
    } on SocketException catch (_) {
      throw ConnectException(message: Errors.connectionFailed);
    } catch (_) {
      rethrow;
    }
  }
}
