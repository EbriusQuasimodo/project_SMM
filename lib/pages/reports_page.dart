import 'package:flutter/material.dart' hide Badge;
import 'package:badges/badges.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_smm/entities/filter_entities/filter_bloc/filters_bloc.dart';
import 'package:project_smm/entities/reports_entities/reports_bloc/reports_bloc.dart';
import 'package:project_smm/pages/filter_page/filter_choice_chip_page.dart';
import 'package:project_smm/shared/constants/local_storage/local_storage_constants.dart';
import 'package:project_smm/shared/lib/local_storage/local_storage.dart';
import 'package:project_smm/shared/lib/routes/app_routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';
import 'package:project_smm/widgets/reports_widgets/report_data_table.dart';
import 'package:provider/provider.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  late final ReportsBloc _bloc = ReportsBloc()..add(ReportsStartLoadingEvent());
  List<String> filters =[];

  @override
  void initState() {
    setState(() {
      filters = LocalStorage.getList(AppConstants.CITYSTATIONLISTCALLS) +
          LocalStorage.getList(AppConstants.SUBSTATIONLISTCALLS) +
          LocalStorage.getList(AppConstants.PRIORITYLISTCALLS) +
          LocalStorage.getList(AppConstants.CITYSTATIONLISTBRIGADES) +
          LocalStorage.getList(AppConstants.SUBSTATIONLISTBRIGADES);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: AppBar(
          title: Text(AppLocalizations.of(context)!.reportsPage),
          actions: [
            Badge(
              badgeStyle: BadgeStyle(badgeColor: ThemeApp.primaryColor),
              showBadge: filters.isNotEmpty,
              position: BadgePosition.topEnd(top: -5, end: 2),
              badgeContent: Text("${filters.length}", style: TextStyle(color: ThemeApp.whiteColor),),
              child: IconButton(
                onPressed: () {Navigator.of(context).push(
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
                ).then((value) => setState(() {}));
                },
                icon: SvgPicture.asset(
                    'assets/images/icons/shared/filter.svg'),
              ),
            ),
          ],
        ),
      ),
      body: Provider(
          create: (context) => _bloc,
          child: RefreshIndicator(
              onRefresh: () async {
                _bloc.add(ReportsStartLoadingEvent());
              },
              child: const ReportDataTable())),
    );
  }
}
