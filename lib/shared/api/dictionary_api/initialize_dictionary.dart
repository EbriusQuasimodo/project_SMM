import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:project_smm/shared/constants/errors_constants/errors_constants.dart';
import 'package:project_smm/shared/constants/local_storage/local_storage_constants.dart';
import 'package:project_smm/shared/lib/errors/exceptions/exceptions.dart';
import 'package:project_smm/shared/lib/local_storage/local_storage.dart';
import 'package:project_smm/shared/lib/dictionary_names/dictionary_enum.dart';
import 'package:project_smm/shared/types/dictionary/dictionary_model.dart';

class InitializeDictionary {
  http.Client client = http.Client();

  Future<DictionaryModel> fetch(Dictionary dictionary) async {
    try {
      var re = await client.get(
        Uri.http('smart103ala.kz', '/sd_mobile/api/dictionaries/${dictionary.name}'),
        headers: {
          'Authorization': LocalStorage.getString(AppConstants.TOKEN),
          'Content-Type': "application/json",
        },);
      print(LocalStorage.getString(AppConstants.TOKEN));
      print(re.statusCode);
      if (re.statusCode == 200) {
        LocalStorage.setString(dictionary.name, utf8.decode(re.bodyBytes));
        final DictionaryModel body =
        DictionaryModel.fromJson(jsonDecode(utf8.decode(re.bodyBytes)));
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
