
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:project_smm/entities/charts_entities/charts_bloc/charts_bloc.dart';
import 'package:project_smm/shared/constants/local_storage/local_storage_constants.dart';
import 'package:project_smm/shared/lib/local_storage/local_storage.dart';
import 'package:project_smm/shared/lib/routes/app_routes.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'legend_item_widget.dart';

class PieChartCalls extends StatelessWidget {
  const PieChartCalls({super.key});

  String mathPercent(int all, int numberOfElements){
    double percent = numberOfElements * 100 / all;
    return percent.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChartsBloc, ChartsState>(builder: (context, state) {

      print(state.runtimeType);
      if (state is ChartsStartLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is ChartsLogoutState) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).pushNamed(
            AppRoutes.auth,
          );
          LocalStorage.setString(AppConstants.TOKEN, '');
        });
      } else if (state is ChartsFailedState) {
        return Center(
          child: Text(state.message),
        );
      } else if (state is ChartsDoneState) {
        print(state.callsChartsModel.all);
        final dataMap = <String, double>{
          AppLocalizations.of(context)!.queue: state.callsChartsModel.queue.toDouble(),
          AppLocalizations.of(context)!.transit: state.callsChartsModel.transit.toDouble(),
          AppLocalizations.of(context)!.service: state.callsChartsModel.service.toDouble(),
          AppLocalizations.of(context)!.hospitalization: state.callsChartsModel.hospitalization.toDouble(),
          AppLocalizations.of(context)!.inHospital: state.callsChartsModel.inHospital.toDouble(),
          AppLocalizations.of(context)!.onResult: state.callsChartsModel.result.toDouble(),
          AppLocalizations.of(context)!.archive: state.callsChartsModel.archive.toDouble(),
        };
        final colorList = <Color>[
          ThemeApp.queueColor,
          ThemeApp.arrivalColor,
          ThemeApp.onServiceColor,
          ThemeApp.hospitalizationColor,
          ThemeApp.inHospitalColor,
          ThemeApp.onResultColor,
          ThemeApp.inArchiveColor,
        ];
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: PieChart(
                dataMap: dataMap,
                centerText: '${state.callsChartsModel.all}',
                centerTextStyle: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w700,
                    color: ThemeApp.secondaryColorTextAndIcons),
                legendOptions: const LegendOptions(showLegends: false),
                chartValuesOptions: const ChartValuesOptions(
                    showChartValues: false, showChartValueBackground: false),
                chartType: ChartType.ring,
                chartRadius: 224,
                colorList: colorList,
                ringStrokeWidth: 36,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LegendItemWidget(
                        color: ThemeApp.queueColor,
                        legendName: " ${AppLocalizations.of(context)!.queue}",
                        numberOfElements: '${state.callsChartsModel.queue} вызовов - ${mathPercent(state.callsChartsModel.all, state.callsChartsModel.queue)}%',
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      LegendItemWidget(
                        color: ThemeApp.arrivalColor,
                        legendName: "${AppLocalizations.of(context)!.transit}",
                        numberOfElements: '${state.callsChartsModel.transit} вызовов - ${mathPercent(state.callsChartsModel.all, state.callsChartsModel.transit)}%',
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      LegendItemWidget(
                        color: ThemeApp.onServiceColor,
                        legendName: "${AppLocalizations.of(context)!.service}",
                        numberOfElements: '${state.callsChartsModel.service} вызовов - ${mathPercent(state.callsChartsModel.all, state.callsChartsModel.service)}%',
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      LegendItemWidget(
                        color: ThemeApp.hospitalizationColor,
                        legendName: "${AppLocalizations.of(context)!.hospitalization}",
                        numberOfElements: '${state.callsChartsModel.hospitalization} вызовов - ${mathPercent(state.callsChartsModel.all, state.callsChartsModel.hospitalization)}%',
                      ),
                    ],
                  ),
                  const SizedBox(width: 32,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LegendItemWidget(
                        color: ThemeApp.inHospitalColor,
                        legendName: "${AppLocalizations.of(context)!.inHospital}",
                        numberOfElements: '${state.callsChartsModel.inHospital} вызовов - ${mathPercent(state.callsChartsModel.all, state.callsChartsModel.inHospital)}%',
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      LegendItemWidget(
                        color: ThemeApp.onResultColor,
                        legendName: "${AppLocalizations.of(context)!.onResult}",
                        numberOfElements: '${state.callsChartsModel.result} вызовов - ${mathPercent(state.callsChartsModel.all, state.callsChartsModel.result)}%',
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      LegendItemWidget(
                        color: ThemeApp.inArchiveColor,
                        legendName: "${AppLocalizations.of(context)!.archive}",
                        numberOfElements: '${state.callsChartsModel.archive} вызовов - ${mathPercent(state.callsChartsModel.all, state.callsChartsModel.archive)}%',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 28,
            ),

          ],
        );
      }
      return const SizedBox.shrink();
    });
  }
}