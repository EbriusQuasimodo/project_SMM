import 'package:project_smm/entities/main_page_entities/main_page_api/data_source/types/statuses_model.dart';
import 'package:project_smm/entities/types/parameters_model/params_model.dart';

List<StatusesList> createBrigadesStatuses(
    List<StatusesList> brigadesStatusesList) {
  brigadesStatusesList
      .add(StatusesList(statusId: 667, statusName: 'Вcе бригады'));
  brigadesStatusesList.add(StatusesList(
      statusId: 10, statusName: 'Свободен')); // 0 4 5 10 status number
  brigadesStatusesList
      .add(StatusesList(statusId: 2, statusName: 'Обслуживание'));
  brigadesStatusesList.add(
      StatusesList(statusId: 6, statusName: 'Перерыв')); // 6 7 8 status number
  return brigadesStatusesList;
}

List<Parameters> addBrigadesStatusesInParametersList(
    List<Parameters> brigadesParametersList, List<String> brigadesStatus) {
  if (brigadesStatus.isNotEmpty && brigadesStatus.contains('667')) {
    brigadesParametersList.removeWhere((element) => element.field == 'status');
    brigadesParametersList.add(Parameters(field: 'status', op: 'in', value: [
      '0',
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '10',
      '11',
      '12'
    ]));
  } else if (brigadesStatus.isNotEmpty && brigadesStatus.contains('10')) {
    brigadesParametersList.removeWhere((element) => element.field == 'status');
    brigadesParametersList.add(
        Parameters(field: 'status', op: 'in', value: ['0', '10']));
  } else if (brigadesStatus.isNotEmpty && brigadesStatus.contains('2')) {
    brigadesParametersList.removeWhere((element) => element.field == 'status');
    brigadesParametersList
        .add(Parameters(field: 'status', op: 'in', value: ['1', '2',' 3','4','5','11','12']));
  } else if (brigadesStatus.isNotEmpty && brigadesStatus.contains('6')) {
    brigadesParametersList.removeWhere((element) => element.field == 'status');
    brigadesParametersList
        .add(Parameters(field: 'status', op: 'in', value: ['6', '7', '8', '9']));
  }
  return brigadesParametersList;
}
