
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_smm/entities/filter_entities/filter_bloc/filters_bloc.dart';
import 'package:project_smm/entities/main_page_entities/main_page_bloc/main_page_bloc.dart';
import 'package:project_smm/pages/filter_page/filter_choice_chip_page.dart';
import 'package:project_smm/pages/main_page/main_page_body_widget.dart';
import 'package:project_smm/shared/lib/routes/app_routes.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isCall = true;

  late final MainPageBloc _bloc = MainPageBloc()
    ..add(MainPageStartLoadingEvent(
        shouldLoadMore: false, callsStatus: [], brigadesStatus: []));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: AppBar(
          title: Text(AppLocalizations.of(context)!.mainPage),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: ThemeApp.secondaryColorTextAndIcons,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return Provider(
                        create: (context) =>
                            FiltersBloc()..add(FiltersStartLoadingEvent()),
                        child: FilterChoiceChipPage(
                          fromWhereOpen: AppRoutes.mainPage,
                          isCall: isCall,
                        ),
                      );
                    },
                  ),
                ).then((value) => setState(() {}));
              },
              icon: SvgPicture.asset('assets/images/icons/shared/filter.svg'),
            )
          ],
        ),
      ),
      body: Provider(
          create: (context) => _bloc,
          child: RefreshIndicator(
              onRefresh: () async {
                _bloc.add(MainPageStartLoadingEvent(
                  shouldLoadMore: false,
                  callsStatus: [],
                  brigadesStatus: [],
                ));
              },
              child: MainPageBodyWidget(
                onTapCallButton: () {
                  setState(() {
                    isCall = true;
                  });
                },
                onTapBrigadeButton: () {
                  setState(() {
                    isCall = false;
                  });
                },
                isCall: isCall,
              ))),
    );
  }
}
