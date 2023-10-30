import 'package:project_smm/entities/types/parameters_model/params_model.dart';
import 'package:project_smm/entities/types/search_model/search_model.dart';
import 'package:project_smm/shared/constants/local_storage/local_storage_constants.dart';
import 'package:project_smm/shared/lib/local_storage/local_storage.dart';

List<Parameters> addCallsParameters(List<Parameters> callsParametersList){
  if (LocalStorage.getList(AppConstants.CITYSTATIONLISTCALLS).isNotEmpty) {
    callsParametersList.add(Parameters(
        field: 'city_station',
        op: 'in',
        value: LocalStorage.getList(AppConstants.CITYSTATIONLISTCALLS).map(int.parse).toList()));
  }
  if (LocalStorage.getList(AppConstants.PRIORITYLISTCALLS).isNotEmpty) {
    callsParametersList.add(Parameters(
        field: 'priority',
        op: 'in',
        value: LocalStorage.getList(AppConstants.PRIORITYLISTCALLS).map(int.parse).toList()));
  }
  if (LocalStorage.getList(AppConstants.SUBSTATIONLISTCALLS).isNotEmpty) {
    callsParametersList.add(Parameters(
        field: 'substation',
        op: 'in',
        value: LocalStorage.getList(AppConstants.SUBSTATIONLISTCALLS).map(int.parse).toList()));
  }
return callsParametersList;
}

List<Parameters> addSearchCallsParameters(List<Parameters> callsParametersList, SearchModel? searchModel){
  // callsParametersList.removeWhere((element) =>
  // element.field == 'apartment' ||
  // element.field == 'house' ||
  //     element.field == 'street' ||
  //     element.field == 'patient_fio' ||
  //     element.field == 'day_number');
  if (searchModel != null) {
    if (searchModel.numberCalls != null) {
      callsParametersList.add(Parameters(
          field: 'day_number',
          op: 'eq',
          value: searchModel.numberCalls));
    }
    if (searchModel.fio != '') {
      callsParametersList.add(Parameters(
          field: 'patient_fio',
          op: 'regexI',
          value: searchModel.fio));
    }
    if (searchModel.street != '') {
      callsParametersList.add(Parameters(
          field: 'street', op: 'regexI', value: searchModel.street));
    }
    if (searchModel.house != '') {
      callsParametersList.add(Parameters(
          field: 'house', op: 'eq', value: searchModel.house));
    }
    if (searchModel.apartment != '') {
      callsParametersList.add(Parameters(
          field: 'apartment', op: 'eq', value: searchModel.apartment));
    }
  } else {
    callsParametersList.removeWhere((element) =>
    element.field == 'house' ||
        element.field == 'street' ||
        element.field == 'patient_fio' ||
        element.field == 'day_number');
  }
  return callsParametersList;
}