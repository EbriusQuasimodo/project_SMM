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

class PieChartBrigades extends StatelessWidget {
  const PieChartBrigades({super.key});

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
          'в пути': state.brigadesChartsModel.transit.toDouble(),
          'обслуживание': state.brigadesChartsModel.service.toDouble(),
          'транспортировка': state.brigadesChartsModel.hospitalization.toDouble(),
          'стационар': state.brigadesChartsModel.inHospital.toDouble(),
          'свободна': state.brigadesChartsModel.free.toDouble(),
          'обяз. возвращение': state.brigadesChartsModel.obligatedReturn.toDouble(),
          'другое': state.brigadesChartsModel.other.toDouble(),
        };
        final colorList = <Color>[
          ThemeApp.arrivalColor,
          ThemeApp.onServiceColor,
          ThemeApp.transportationColor,
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 25),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LegendItemWidget(
                        color: ThemeApp.arrivalColor,
                        text: "в пути",
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      LegendItemWidget(
                        color: ThemeApp.onServiceColor,
                        text: "обслуживание",
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      LegendItemWidget(
                        color: ThemeApp.transportationColor,
                        text: "транспортировка",
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      LegendItemWidget(
                        color: ThemeApp.inHospitalColor,
                        text: "стационар",
                      ),
                    ],
                  ),
                  SizedBox(width: 32,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LegendItemWidget(
                        color: ThemeApp.brigadeFreeColor,
                        text: "свободна",
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      LegendItemWidget(
                        color: ThemeApp.mandatoryReturnToPSColor,
                        text: "обяз. возвращение",
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      LegendItemWidget(
                        color: ThemeApp.breakColor,
                        text: "другое",
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