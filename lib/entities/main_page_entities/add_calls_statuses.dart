import 'package:project_smm/entities/main_page_entities/main_page_api/data_source/types/statuses_model.dart';
import 'package:project_smm/entities/types/parameters_model/params_model.dart';

List<StatusesList> createCallsStatuses(List<StatusesList> callsStatusesList) {
  callsStatusesList.add(StatusesList(statusId: 666, statusName: 'Вcе вызовы'));
  callsStatusesList.add(StatusesList(statusId: 1, statusName: 'В очереди'));
  callsStatusesList.add(StatusesList(statusId: 3, statusName: 'Обслуживание'));
  callsStatusesList
      .add(StatusesList(statusId: 4, statusName: 'Транспортировка'));
  callsStatusesList.add(StatusesList(statusId: 6, statusName: 'Стационар'));
  callsStatusesList.add(StatusesList(statusId: 5, statusName: 'Завершено'));
  callsStatusesList.add(StatusesList(statusId: 2, statusName: 'В пути'));
  return callsStatusesList;
}

List<Parameters> addCallsStatusesInParametersList(
    List<Parameters> callsParametersList, List<String> callsStatus) {
  if (callsStatus.isNotEmpty && callsStatus.contains('666')) {
    callsParametersList.removeWhere((element) => element.field == 'status');
    callsParametersList.add(Parameters(
        field: 'status', op: 'in', value: ['1', '2', '3', '4', '5', '6']));
  } else if(callsStatus.isNotEmpty && callsStatus.contains('2')){
    callsParametersList.removeWhere((element) => element.field == 'status');
    callsParametersList
        .add(Parameters(field: 'status', op: 'in', value: ['2','7']));
  }else if(callsStatus.isNotEmpty && callsStatus.contains('5')){
    callsParametersList.removeWhere((element) => element.field == 'status');
    callsParametersList
        .add(Parameters(field: 'status', op: 'in', value: ['5','20']));
  }else if (callsStatus.isNotEmpty) {
    callsParametersList.removeWhere((element) => element.field == 'status');
    callsParametersList
        .add(Parameters(field: 'status', op: 'in', value: callsStatus));
  }
  return callsParametersList;
}
