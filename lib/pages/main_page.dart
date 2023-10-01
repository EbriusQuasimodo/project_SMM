import 'package:flutter/material.dart' hide Badge;
import 'package:flutter/scheduler.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_smm/entities/main_page_entities/main_page_bloc/main_page_bloc.dart';
import 'package:project_smm/features/calls_list_or_brigades_list/change_list_widget.dart';
import 'package:project_smm/shared/constants/local_storage/local_storage_constants.dart';
import 'package:project_smm/shared/lib/local_storage/local_storage.dart';
import 'package:project_smm/shared/lib/routes/app_routes.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';
import 'package:project_smm/shared/ui/list_item_cards/brigades_card/brigades_card.dart';
import 'package:project_smm/shared/ui/list_item_cards/calls_card/calls_card.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isCall = true;
  int allCountsCalls = 0;
  int allCountsBrigades = 0;

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
                  Navigator.of(context).pushNamed(AppRoutes.filter);
                },
                icon: SvgPicture.asset('assets/images/icons/shared/filter.svg'),
              )
            ],
          ),
        ),
        body: BlocBuilder<MainPageBloc, MainPageState>(
          builder: (context, state) {
            if (state is MainPageLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is MainPageLogoutState) {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context).pushNamed(
                  AppRoutes.auth,
                );
                LocalStorage.setString(AppConstants.TOKEN, '');
              });
            } else if (state is MainPageFailedState) {
              return Center(
                child: Text(state.message),
              );
            } else if (state is MainPageCallsDoneState) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SwitchCallsOrBrigadeItem(
                      allCountsCalls: state.allCountCalls,
                      allCountsBrigades: state.allCountBrigades,
                      isCall: isCall,
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
                    ),
                    isCall
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height - 100,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: state.calls.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return CallsCard(
                                    callsInfo: state.calls[index],
                                  );
                                }),
                          )
                        : state.brigades == null ?Center(child: Text('бригады не найдены'),)
                        : SizedBox(
                      height: MediaQuery.of(context).size.height - 100,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.brigades?.length,
                          itemBuilder: (BuildContext context, int index) {
                            return BrigadesCard(
                              brigadesInfo: state.brigades?[index],
                            );
                          }),
                    ),
                  ],
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ));
  }
}
