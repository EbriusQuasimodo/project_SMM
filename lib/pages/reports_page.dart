import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_smm/entities/filter_entities/filter_bloc/filters_bloc.dart';
import 'package:project_smm/entities/reports_entities/reports_bloc/reports_bloc.dart';
import 'package:project_smm/entities/types/reports_model/reports_model.dart';
import 'package:project_smm/pages/filter_page/filter_choice_chip_page.dart';
import 'package:project_smm/shared/constants/local_storage/local_storage_constants.dart';
import 'package:project_smm/shared/lib/local_storage/local_storage.dart';
import 'package:project_smm/shared/lib/routes/app_routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';
import 'package:project_smm/widgets/nav_bar_widgets/nav_bar/nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class ReportsPage extends StatefulWidget {
  ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  late final ReportsBloc _bloc = ReportsBloc()..add(ReportsStartLoadingEvent());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(64),
          child: AppBar(
            title: Text(AppLocalizations.of(context)!.reportsPage),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return Provider(
                          create: (context) =>
                          FiltersBloc()..add(FiltersStartLoadingEvent()),
                          child: FilterChoiceChipPage(
                            fromWhereOpen: AppRoutes.reports,
                            isCall: true,
                          ),
                        );
                      },
                    ),
                  ).then((value) => setState((){}));
                },
                icon: SvgPicture.asset('assets/images/icons/shared/filter.svg'),
              )
            ],
          ),
        ),
        body: //Provider(create: (context) => _bloc, child:
            ReportDataTable()
        // ),
        );
  }
}

class ReportDataTable extends StatefulWidget {
  ReportDataTable({super.key});

  @override
  State<ReportDataTable> createState() => _ReportDataTableState();
}

class _ReportDataTableState extends State<ReportDataTable> {
  List<Report>? report;

  late ReportDataSource _reportDataSource;

  List<Employee> employees = <Employee>[];

  late EmployeeDataSource employeeDataSource;

  @override
  void initState() {
    super.initState();
    employees = getEmployeeData();
    employeeDataSource = EmployeeDataSource(employeeData: employees);
  }

  @override
  Widget build(BuildContext context) {
    //return BlocBuilder<ReportsBloc, ReportsState>(
    //   builder: (context, state) {
    //   if (state is ReportsStartLoadingState) {
    //     return const Center(
    //       child: CircularProgressIndicator(),
    //     );
    //   } else if (state is ReportsLogoutState) {
    //     SchedulerBinding.instance.addPostFrameCallback((_) {
    //       Navigator.of(context).pushNamed(
    //         AppRoutes.auth,
    //       );
    //       LocalStorage.setString(AppConstants.TOKEN, '');
    //     });
    //   } else if (state is ReportsFailedState) {
    //     return Center(
    //       child: Text(state.message),
    //     );
    //   } else if (state is ReportsDoneState) {
    //     report = getReportData(state);
    //     _reportDataSource = ReportDataSource(report: report!);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      height: MediaQuery.of(context).size.height,
      child: SfDataGridTheme(
        data: SfDataGridThemeData(headerColor: ThemeApp.surfaceColorTwo, gridLineColor: ThemeApp.dividerTwoColor),
        child: SfDataGrid(
            gridLinesVisibility: GridLinesVisibility.both,
            headerGridLinesVisibility: GridLinesVisibility.both,
            headerRowHeight: 50,
            source: employeeDataSource,
            columns: [
              GridColumn(
                  columnName: 'Данные',
                  label: Container(
                      padding: EdgeInsets.zero,
                      alignment: Alignment.center,
                      child: Text(
                        'Данные',
                        overflow: TextOverflow.ellipsis,
                      ))),
              GridColumn(
                  columnName: 'Вчера, \n  шт',
                  label: Container(

                      padding: EdgeInsets.zero,
                      //padding: EdgeInsets.symmetric(horizontal: 16.0),
                      alignment: Alignment.center,
                      child: Text(
                        'Вчера, \n  шт',
                        overflow: TextOverflow.ellipsis,
                      ))),
              GridColumn(
                  columnName: 'шт',
                  label: Container(

                      padding: EdgeInsets.zero,
                      //padding: EdgeInsets.symmetric(horizontal: 16.0),
                      alignment: Alignment.center,
                      child: Text(
                        'шт',
                        overflow: TextOverflow.ellipsis,
                      ))),
              GridColumn(
                  columnName: '%',
                  label: Container(
                      padding: EdgeInsets.zero,
                      //padding: EdgeInsets.symmetric(horizontal: 16.0),
                      alignment: Alignment.center,
                      child: Text(
                        '%',
                        overflow: TextOverflow.ellipsis,
                      ))),
            ],
            stackedHeaderRows: <StackedHeaderRow>[
              StackedHeaderRow(cells: [
                StackedHeaderCell(
                    columnNames: ['шт', '%'],
                    child: Container(
                        padding: EdgeInsets.zero,
                        child: Center(child: Text('Сегодня')))),
              ])
            ]),
      ),
    );
    //}
    //  return const SizedBox.shrink();
    //  },
    //);
    // return Container(
    //   margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    //   decoration: BoxDecoration(
    //       color: ThemeApp.surfaceColorTwo,
    //       borderRadius: BorderRadius.only(
    //           topLeft: Radius.circular(8), topRight: Radius.circular(8)),
    //       border: Border.all(color: ThemeApp.dividerTwoColor)),
    //   child: Row(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     children: [
    //       Container(
    //         child: Text('Данные'),
    //       ),
    //       Spacer(),
    //       Container(
    //         color: ThemeApp.dividerTwoColor,
    //         width: 2,
    //       ),
    //       Container(
    //         child: Text('Вчера, \n   шт'),
    //       ),
    //
    //       Container(
    //         color: ThemeApp.dividerTwoColor,
    //         width: 2,
    //       ),
    //
    //       Spacer(),
    //       Column(
    //         children: [
    //           Container(
    //             child: Text('Сегодня'),
    //           ),
    //           Container(
    //             color: ThemeApp.dividerTwoColor,
    //             height: 1,
    //             width: MediaQuery.of(context).size.width - 137,
    //             padding: EdgeInsets.only(top: 4, bottom: 4,),
    //           ),
    //           Row(
    //             children: [
    //               Container(
    //                 child: Text('шт'),
    //               ),
    //               Container(
    //                 color: ThemeApp.dividerTwoColor,
    //                 width: 1,
    //                 padding: EdgeInsets.only(left: 4, right: 4),
    //               ),
    //               Container(
    //                 child: Text('%'),
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //
    //     ],
    //   ),
    // );
  }
}

List<Employee> getEmployeeData() {
  return [
    Employee(10001, 'James', 'Project Lead', 20000),
    Employee(10002, 'Kathryn', 'Manager', 30000),
    Employee(10003, 'Lara', 'Developer', 15000),
    Employee(10004, 'Michael', 'Designer', 15000),
    Employee(10005, 'Martin', 'Developer', 15000),
    Employee(10006, 'Newberry', 'Developer', 15000),
    Employee(10007, 'Balnc', 'Developer', 15000),
    Employee(10008, 'Perry', 'Developer', 15000),
    Employee(10009, 'Gable', 'Developer', 15000),
    Employee(10010, 'Grimes', 'Developer', 15000),
    Employee(10010, 'Grimes', 'Developer', 15000),
    Employee(10010, 'Grimes', 'Developer', 15000),
    Employee(10010, 'Grimes', 'Developer', 15000),
    Employee(10010, 'Grimes', 'Developer', 15000),
  ];
}

/// Custom business object class which contains properties to hold the detailed
/// information about the employee which will be rendered in datagrid.
class Employee {
  /// Creates the employee class with required details.
  Employee(this.id, this.name, this.designation, this.salary);

  /// Id of an employee.
  final int id;

  /// Name of an employee.
  final String name;

  /// Designation of an employee.
  final String designation;

  /// Salary of an employee.
  final int salary;
}

/// An object to set the employee collection data source to the datagrid. This
/// is used to map the employee data to the datagrid widget.
class EmployeeDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  EmployeeDataSource({required List<Employee> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: e.id),
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<String>(
                  columnName: 'designation', value: e.designation),
              DataGridCell<int>(columnName: 'salary', value: e.salary),
            ]))
        .toList();
  }

  List<DataGridRow> _employeeData = [];

  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }
}

List<Report> getReportData(ReportsDoneState state) {
  return [
    Report('Обращений', state.reportsModel.yesterday!.all,
        state.reportsModel.today!.all, 20000),
    Report('Повторные', state.reportsModel.yesterday!.repeats.value,
        state.reportsModel.today!.repeats.value, 30000),
    Report('Без выезда', state.reportsModel.yesterday!.withoutTransit.value,
        state.reportsModel.today!.withoutTransit.value, 15000),
    Report('Безрезультатных', state.reportsModel.yesterday!.withoutResult.value,
        state.reportsModel.today!.withoutResult.value, 15000),
    Report('Всего выездов', state.reportsModel.yesterday!.withTransit.all.value,
        state.reportsModel.today!.withTransit.all.value, 15000),
    Report(
        '1-3 срочность',
        state.reportsModel.yesterday!.withTransit.firstThirdPriority.value,
        state.reportsModel.today!.withTransit.firstThirdPriority.value,
        15000),
    Report(
        '4 срочность',
        state.reportsModel.yesterday!.withTransit.fourthPriority.value,
        state.reportsModel.today!.withTransit.fourthPriority.value,
        15000),
    Report('Другое', state.reportsModel.yesterday!.withTransit.other.value,
        state.reportsModel.today!.withTransit.other.value, 15000),
    Report('1 срочность', state.reportsModel.yesterday!.firstPriority.all.value,
        state.reportsModel.today!.firstPriority.all.value, 15000),
    Report(
        'Оперативность',
        state.reportsModel.yesterday!.firstPriority.efficiency.value,
        state.reportsModel.today!.firstPriority.efficiency.value,
        15000),
    Report(
        '2 срочность',
        state.reportsModel.yesterday!.secondPriority.all.value,
        state.reportsModel.today!.secondPriority.all.value,
        15000),
    Report(
        'Оперативность',
        state.reportsModel.yesterday!.secondPriority.efficiency.value,
        state.reportsModel.today!.secondPriority.efficiency.value,
        15000),
    Report('3 срочность', state.reportsModel.yesterday!.thirdPriority.all.value,
        state.reportsModel.today!.thirdPriority.all.value, 15000),
    Report(
        'Оперативность',
        state.reportsModel.yesterday!.thirdPriority.efficiency.value,
        state.reportsModel.today!.thirdPriority.efficiency.value,
        15000),
    Report(
        '4 срочность',
        state.reportsModel.yesterday!.fourthPriority.all.value,
        state.reportsModel.today!.fourthPriority.all.value,
        15000),
    Report(
        'Оперативность',
        state.reportsModel.yesterday!.fourthPriority.efficiency.value,
        state.reportsModel.today!.fourthPriority.efficiency.value,
        15000),
    Report(
        'Среднее время оказания помощи',
        state.reportsModel.yesterday!.avgHealTime.value.toInt(),
        state.reportsModel.today!.avgHealTime.value.toInt(),
        15000),
    Report(
        'ОССМП',
        state.reportsModel.yesterday!.avgHealTime.polyclinicValue.toInt(),
        state.reportsModel.today!.avgHealTime.polyclinicValue.toInt(),
        15000),
    Report(
        'СМП при ПМСП',
        state.reportsModel.yesterday!.avgHealTime.noPolyclinicValue.toInt(),
        state.reportsModel.today!.avgHealTime.noPolyclinicValue.toInt(),
        15000),
    Report(
        'Среднее время доезда',
        state.reportsModel.yesterday!.avgArriveTime.value.toInt(),
        state.reportsModel.today!.avgArriveTime.value.toInt(),
        15000),
    Report(
        'ОССМП',
        state.reportsModel.yesterday!.avgArriveTime.polyclinicValue.toInt(),
        state.reportsModel.today!.avgArriveTime.polyclinicValue.toInt(),
        15000),
    Report(
        'СМП при ПМСП',
        state.reportsModel.yesterday!.avgArriveTime.noPolyclinicValue.toInt(),
        state.reportsModel.today!.avgArriveTime.noPolyclinicValue.toInt(),
        15000),
    Report(
        'Доставлены в МО',
        state.reportsModel.yesterday!.transitToMoCalls.all.value,
        state.reportsModel.today!.transitToMoCalls.all.value,
        15000),
    Report(
        'на госпитализацию',
        state.reportsModel.yesterday!.transitToMoCalls.hospitalization.value,
        state.reportsModel.today!.transitToMoCalls.hospitalization.value,
        15000),
    Report(
        'для оказания помощи',
        state.reportsModel.yesterday!.transitToMoCalls.help.value,
        state.reportsModel.today!.transitToMoCalls.help.value,
        15000),
    Report('Прочие', state.reportsModel.yesterday!.transitToMoCalls.other.value,
        state.reportsModel.today!.transitToMoCalls.other.value, 15000),
    Report('Вызова по ЧС', state.reportsModel.yesterday!.emergency.value,
        state.reportsModel.today!.emergency.value, 15000),
    Report('Летальность', state.reportsModel.yesterday!.lethal.all.value,
        state.reportsModel.today!.lethal.all.value, 15000),
    Report('до СМП', state.reportsModel.yesterday!.lethal.beforeSmp.value,
        state.reportsModel.today!.lethal.beforeSmp.value, 15000),
    Report(
        'При СМП/В машине СМП',
        state.reportsModel.yesterday!.lethal.afterSmp.value,
        state.reportsModel.today!.lethal.afterSmp.value,
        15000),
    Report('Реанимация', state.reportsModel.yesterday!.reanimation.all.value,
        state.reportsModel.today!.reanimation.all.value, 15000),
    Report('успешная', state.reportsModel.yesterday!.reanimation.success.value,
        state.reportsModel.today!.reanimation.success.value, 15000),
    Report(
        'безуспешная',
        state.reportsModel.yesterday!.reanimation.failed.value,
        state.reportsModel.today!.reanimation.failed.value,
        15000),
    Report('ШОКИ', state.reportsModel.yesterday!.shock.value,
        state.reportsModel.today!.shock.value, 15000),
    Report('ОКС', state.reportsModel.yesterday!.oks.all.value,
        state.reportsModel.today!.oks.all.value, 15000),
    Report('с подъёмом ST', state.reportsModel.yesterday!.oks.withUpSt.value,
        state.reportsModel.today!.oks.withUpSt.value, 15000),
    Report(
        'без подъёмома ST',
        state.reportsModel.yesterday!.oks.withoutUpSt.value,
        state.reportsModel.today!.oks.withoutUpSt.value,
        15000),
    Report('ОНМК', state.reportsModel.yesterday!.onmk.all.value,
        state.reportsModel.today!.onmk.all.value, 15000),
    Report(
        'в течении 40 минут',
        state.reportsModel.yesterday!.onmk.lt40Min.value,
        state.reportsModel.today!.onmk.lt40Min.value,
        15000),
    Report('более 40 минут', state.reportsModel.yesterday!.onmk.gt40Min.value,
        state.reportsModel.today!.onmk.gt40Min.value, 15000),
    Report('Беременные', state.reportsModel.yesterday!.pregnancy.all.value,
        state.reportsModel.today!.pregnancy.all.value, 15000),
    Report(
        'отказ от госпитализации',
        state.reportsModel.yesterday!.pregnancy.hospitalizationRefuse.value,
        state.reportsModel.today!.pregnancy.hospitalizationRefuse.value,
        15000),
    Report(
        'Преэклампсии или эклампсии',
        state.reportsModel.yesterday!.pregnancy.eclampsia.value,
        state.reportsModel.today!.pregnancy.eclampsia.value,
        15000),
    Report(
        'домашние/дорожные роды',
        state.reportsModel.yesterday!.pregnancy.home.value,
        state.reportsModel.today!.pregnancy.home.value,
        15000),
    Report('ОРВИ/пневмонии', state.reportsModel.yesterday!.orvi.value,
        state.reportsModel.today!.orvi.value, 15000),
    Report('Инфекции', state.reportsModel.yesterday!.infection.value,
        state.reportsModel.today!.infection.value, 15000),
  ];
}

class Report {
  Report(this.data, this.yesterdayValue, this.todayValue, this.todayPercent);

  final String data;

  final int yesterdayValue;

  final int todayValue;

  final num todayPercent;
}

class ReportDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  ReportDataSource({required List<Report> report}) {
    _reportData = report
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'Данные', value: e.data),
              DataGridCell<int>(
                  columnName: 'Вчера, \n  шт', value: e.yesterdayValue),
              DataGridCell<int>(columnName: 'шт', value: e.todayValue),
              DataGridCell<num>(columnName: '%', value: e.todayPercent),
            ]))
        .toList();
  }

  List<DataGridRow> _reportData = [];

  @override
  List<DataGridRow> get rows => _reportData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }
}
