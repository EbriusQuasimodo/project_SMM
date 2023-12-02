import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:project_smm/entities/charts_entities/charts_bloc/charts_bloc.dart';
import 'package:project_smm/shared/constants/local_storage/local_storage_constants.dart';
import 'package:project_smm/shared/lib/local_storage/local_storage.dart';
import 'package:project_smm/shared/lib/routes/app_routes.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';
import 'package:project_smm/widgets/analytics_widgets/legend_item_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class PieChartBrigades extends StatelessWidget {
  const PieChartBrigades({super.key});
  String mathPercent(int all, int numberOfElements){
    double percent = numberOfElements * 100 / all;
    return percent.toStringAsFixed(2);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChartsBloc, ChartsState>(builder: (context, state) {
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
        final dataMap = <String, double>{
          AppLocalizations.of(context)!.transit: state.brigadesChartsModel.transit.toDouble(),
          AppLocalizations.of(context)!.service: state.brigadesChartsModel.service.toDouble(),
          AppLocalizations.of(context)!.hospitalization: state.brigadesChartsModel.hospitalization.toDouble(),
          AppLocalizations.of(context)!.inHospital: state.brigadesChartsModel.inHospital.toDouble(),
          AppLocalizations.of(context)!.free: state.brigadesChartsModel.free.toDouble(),
          AppLocalizations.of(context)!.obligatedReturn: state.brigadesChartsModel.obligatedReturn.toDouble(),
          AppLocalizations.of(context)!.other: state.brigadesChartsModel.other.toDouble(),
        };
        final colorList = <Color>[
          ThemeApp.arrivalColor,
          ThemeApp.onServiceColor,
          ThemeApp.hospitalizationColor,
          ThemeApp.inHospitalColor,
          ThemeApp.brigadeFreeColor,
          ThemeApp.mandatoryReturnToPSColor,
          ThemeApp.breakColor,
        ];
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: PieChart(
                dataMap: dataMap,
                centerText: '${state.brigadesChartsModel.all}',
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LegendItemWidget(
                        color: ThemeApp.arrivalColor,
                        legendName: "${AppLocalizations.of(context)!.transit}",
                        numberOfElements: '${state.brigadesChartsModel.transit} вызовов - ${mathPercent(state.brigadesChartsModel.all, state.brigadesChartsModel.transit)}%',

                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      LegendItemWidget(
                        color: ThemeApp.onServiceColor,
                        legendName: "${AppLocalizations.of(context)!.service}",
                        numberOfElements: '${state.brigadesChartsModel.service} вызовов - ${mathPercent(state.brigadesChartsModel.all, state.brigadesChartsModel.service)}%',

                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      LegendItemWidget(
                        color: ThemeApp.hospitalizationColor,
                        legendName: "${AppLocalizations.of(context)!.hospitalization}",
                        numberOfElements: '${state.brigadesChartsModel.hospitalization} вызовов - ${mathPercent(state.brigadesChartsModel.all, state.brigadesChartsModel.hospitalization)}%',

                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      LegendItemWidget(
                        color: ThemeApp.inHospitalColor,
                        legendName: "${AppLocalizations.of(context)!.inHospital}",
                        numberOfElements: '${state.brigadesChartsModel.inHospital} вызовов - ${mathPercent(state.brigadesChartsModel.all, state.brigadesChartsModel.inHospital)}%',

                      ),
                    ],
                  ),
                  const SizedBox(width: 32,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LegendItemWidget(
                        color: ThemeApp.brigadeFreeColor,
                        legendName: "${AppLocalizations.of(context)!.free}",
                        numberOfElements: '${state.brigadesChartsModel.free} вызовов - ${mathPercent(state.brigadesChartsModel.all, state.brigadesChartsModel.free)}%',

                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      LegendItemWidget(
                        color: ThemeApp.mandatoryReturnToPSColor,
                        legendName: "${AppLocalizations.of(context)!.obligatedReturn}",
                        numberOfElements: '${state.brigadesChartsModel.obligatedReturn} вызовов - ${mathPercent(state.brigadesChartsModel.all, state.brigadesChartsModel.obligatedReturn)}%',

                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      LegendItemWidget(
                        color: ThemeApp.breakColor,
                        legendName: "${AppLocalizations.of(context)!.other}",
                        numberOfElements: '${state.brigadesChartsModel.other} вызовов - ${mathPercent(state.brigadesChartsModel.all, state.brigadesChartsModel.other)}%',

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