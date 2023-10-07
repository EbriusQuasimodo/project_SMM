import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_smm/entities/charts_entities/charts_bloc/charts_bloc.dart';
import 'package:project_smm/shared/lib/routes/app_routes.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project_smm/widgets/analytics_widgets/pie_chart_brigades.dart';
import 'package:project_smm/widgets/analytics_widgets/pie_chart_calls.dart';
import 'package:provider/provider.dart';

class AnalyticsPage extends StatelessWidget {
  AnalyticsPage({super.key});

  late final ChartsBloc _bloc = ChartsBloc()..add(ChartsStartLoadingEvent());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: AppBar(
          title: Text(AppLocalizations.of(context)!.analyticsPage),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.filter);
              },
              icon: SvgPicture.asset('assets/images/icons/shared/filter.svg'),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding:
                  EdgeInsets.only(top: 16, bottom: 12, left: 16, right: 16),
              child: Text(
                'Вызовы',
                style: TextStyle(
                    color: ThemeApp.bodyColorTextAndIcons,
                    fontWeight: FontWeight.w400,
                    fontSize: 22),
              ),
            ),
            Provider(create: (context) => _bloc, child: const PieChartCalls()),
            const Padding(
              padding:
                  EdgeInsets.only(top: 16, bottom: 12, left: 16, right: 16),
              child: Text(
                'Бригады',
                style: TextStyle(
                    color: ThemeApp.bodyColorTextAndIcons,
                    fontWeight: FontWeight.w400,
                    fontSize: 22),
              ),
            ),
            Provider(create: (context) => _bloc, child: const PieChartBrigades()),
          ],
        ),
      ),
    );
  }
}
