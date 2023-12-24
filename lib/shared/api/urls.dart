class Urls {
  static Urls get _singletonUrls => Urls._debug();
  static final Urls _instance = _singletonUrls;

  // factory Urls.init(String prefix) {
  //   if (prefix == '/sd_mobile/api/') {
  //     _instance = _singletonUrls;
  //   }
  //   return _instance;
  // }

  static String srv = 'smart103ala.kz';
  late ModelApi _api;

  static ModelApi get api => Urls._instance._api;

  Urls._debug() {
    _api = listApi();
  }

  ModelApi listApi() {
    return ModelApi(
      /// login
      login: Uri.http(srv, '/sd_mobile/api/login'),

      /// passwordChange
      passwordChange: Uri.http(srv, '/sd_mobile/api/user/password'),

      /// callsOperative
      callsOperative: Uri.http(srv, '/sd_mobile/api/calls/operative'),

      /// callsFavorite
      callsFavorite: Uri.http(srv, '/sd_mobile/api/calls/favorite'),
      /// callsCharts
      callsCharts: Uri.http(srv, '/sd_mobile/api/charts/calls/statuses'),

      /// reports
     reports: Uri.http(srv, '/sd_mobile/api/reports/daily'),
      ///brigadesOperative
      brigadesOperative: Uri.http(srv, '/sd_mobile/api/brigades/operative'),

      /// brigadesFavorite
     brigadesFavorite: Uri.http(srv, '/sd_mobile/api/brigades/favorite'),
      /// brigadesCharts
      brigadesCharts: Uri.http(srv, '/sd_mobile/api/charts/brigades/statuses'),

    );
  }
}

class ModelApi {
  Uri login;
  Uri passwordChange;
  Uri callsOperative;
  Uri callsFavorite;
  Uri callsCharts;
  Uri reports;
  Uri brigadesOperative;
  Uri brigadesFavorite;
  Uri brigadesCharts;

  ModelApi({
    required this.login,
    required this.passwordChange,
    required this.callsOperative,
    required this.callsFavorite,
    required this.callsCharts,
    required this.reports,
    required this.brigadesOperative,
    required this.brigadesFavorite,
    required this.brigadesCharts,
  });
}
