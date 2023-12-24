import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:project_smm/entities/types/parameters_model/params_model.dart';
import 'package:project_smm/entities/types/reports_model/reports_model.dart';
import 'package:project_smm/shared/api/urls.dart';
import 'package:project_smm/shared/constants/errors_constants/errors_constants.dart';
import 'package:project_smm/shared/constants/local_storage/local_storage_constants.dart';
import 'package:project_smm/shared/lib/errors/exceptions/exceptions.dart';
import 'package:project_smm/shared/lib/local_storage/local_storage.dart';

class ReportsData {
  http.Client client = http.Client();

  Future<ReportsModel> fetch(List<Parameters> params) async {
    try {
      var re = await client.post(
          Urls.api.reports.replace(
              path: Urls.api.reports.path
          ),
          headers: {
            'Authorization': LocalStorage.getString(AppConstants.TOKEN),
            'Content-Type': "application/json",
          },
          body: json.encode({"parameters": params}));

      if (re.statusCode == 200) {
        final ReportsModel body =
            ReportsModel.fromJson(jsonDecode(utf8.decode(re.bodyBytes)));
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
