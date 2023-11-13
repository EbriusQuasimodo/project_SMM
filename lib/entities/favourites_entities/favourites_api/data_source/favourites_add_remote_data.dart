import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:project_smm/entities/types/basic_model.dart';
import 'package:project_smm/shared/constants/errors_constants/errors_constants.dart';
import 'package:project_smm/shared/constants/local_storage/local_storage_constants.dart';
import 'package:project_smm/shared/lib/errors/exceptions/exceptions.dart';
import 'package:project_smm/shared/lib/local_storage/local_storage.dart';

class FavouritesAddData {
  http.Client client = http.Client();

  Future<BasicModel> fetch(int id, String whatAdd) async {
    try {
      var re = await client.post(
        Uri.http('smart103ala.kz', '/sd_mobile/api/$whatAdd/favorite/$id'),
        headers: {
          'Authorization': LocalStorage.getString(AppConstants.TOKEN),
          'Content-Type': "application/json",
        },
      );

      if (re.statusCode == 200) {
        final BasicModel body =
            BasicModel.fromJson(jsonDecode(utf8.decode(re.bodyBytes)));
        return body;
      } else if (re.statusCode == 400) {
        throw UnAuthException(message: Errors.wrongLoginOrPassword);
      } else if (re.statusCode == 401) {
        throw LogOutException(message: 'токен устарел');
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
