import 'package:project_smm/entities/types/parameters_model/params_model.dart';
import 'package:project_smm/entities/types/search_model/search_model.dart';
import 'package:project_smm/shared/constants/local_storage/local_storage_constants.dart';
import 'package:project_smm/shared/lib/local_storage/local_storage.dart';

List<Parameters> addBrigadesParameters(List<Parameters> brigadesParametersList){
  if (LocalStorage.getList(AppConstants.CITYSTATIONLISTBRIGADES).isNotEmpty) {
    brigadesParametersList.add(Parameters(
        field: 'city_station',
        op: 'in',
        value: LocalStorage.getList(AppConstants.CITYSTATIONLISTBRIGADES).map(int.parse).toList()));
  }

  if (LocalStorage.getList(AppConstants.SUBSTATIONLISTBRIGADES).isNotEmpty) {
    brigadesParametersList.add(Parameters(
        field: 'substation',
        op: 'in',
        value: LocalStorage.getList(AppConstants.SUBSTATIONLISTBRIGADES).map(int.parse).toList()));
  }
  return brigadesParametersList;
}

List<Parameters> addSearchBrigadesParameters(List<Parameters> brigadesParametersList, SearchModel? searchModel){
  brigadesParametersList.removeWhere((element) =>
  element.field == 'profile' ||
      element.field == 'number');
  if (searchModel != null) {
    if (searchModel.numberBrigades != '') {
      brigadesParametersList.add(Parameters(
          field: 'number',
          op: 'eq',
          value: searchModel.numberBrigades));
    }

    if (searchModel.profile.isNotEmpty) {
      brigadesParametersList.add(Parameters(
          field: 'profile', op: 'in', value: searchModel.profile));
    }
  } else {
    brigadesParametersList.removeWhere((element) =>
    element.field == 'profile' ||
        element.field == 'number');
  }
  return brigadesParametersList;
}