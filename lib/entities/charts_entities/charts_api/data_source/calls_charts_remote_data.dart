import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:project_smm/entities/types/charts_model/calls_charts_model.dart';
import 'package:project_smm/shared/constants/errors_constants/errors_constants.dart';
import 'package:project_smm/shared/constants/local_storage/local_storage_constants.dart';
import 'package:project_smm/shared/lib/errors/exceptions/exceptions.dart';
import 'package:project_smm/shared/lib/local_storage/local_storage.dart';
import 'package:project_smm/entities/types/parameters_model/params_model.dart';

class CallsChartData {
  http.Client client = http.Client();
  Future<CallsChartsModel> fetch(List<Parameters> params) async {
    try {
      var re = await client.post(
          Uri.http('smart103ala.kz', '/sd_mobile/api/charts/calls/statuses'),
          headers: {
            'Authorization': LocalStorage.getString(AppConstants.TOKEN),
            'Content-Type': "application/json",
          },
          body: json.encode({"parameters" : params}));
      print(LocalStorage.getString(AppConstants.TOKEN));
      print(re.statusCode);
      if (re.statusCode == 200) {
        final CallsChartsModel body =
        CallsChartsModel.fromJson(jsonDecode(utf8.decode(re.bodyBytes)));
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

