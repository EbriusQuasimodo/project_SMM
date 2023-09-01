import 'package:flutter/material.dart' hide Badge;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_smm/entities/main_page_entities/main_page_bloc/main_page_bloc.dart';
import 'package:project_smm/shared/constants/local_storage/local_storage_constants.dart';
import 'package:project_smm/shared/lib/local_storage/local_storage.dart';
import 'package:project_smm/shared/lib/routes/app_routes.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';
import 'package:project_smm/shared/ui/buttons/switch_calls_or_brigade_item/switch_item.dart';
import 'package:project_smm/shared/ui/list_item_card/list_item_card.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

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
              onPressed: () {},
              icon: SvgPicture.asset('assets/images/icons/shared/filter.svg'),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SwitchCallsOrBrigadeItem(itemsLength: 10),
          BlocBuilder<MainPageBloc, MainPageState>(
            builder: (context, state) {
              if (state is MainPageLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is MainPageLogoutState) {
                LocalStorage.setString(AppConstants.TOKEN, '');
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(AppRoutes.auth, (route) => false);
              } else if (state is MainPageFailedState) {
                return Center(
                  child: Text(state.message),
                );
              } else if (state is MainPageCallsDoneState) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height - 16,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.calls.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListItemCard(
                          itemCallsInfo: state.calls[index],
                        );
                      }),
                );
              } else if (state is MainPageBrigadesDoneState) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height - 16,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.brigades.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListItemCard(
                          itemBrigadesInfo: state.brigades[index],
                        );
                      }),
                );
              }
              return const SizedBox.shrink();
            },
          )
        ]),
      ),
    );
  }
}
