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
import 'package:project_smm/shared/lib/statuses/brigades_statuses.dart';
import 'package:project_smm/shared/lib/statuses/calls_statuses.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';
import 'package:project_smm/shared/ui/list_item_cards/brigades_card/brigades_card.dart';
import 'package:project_smm/shared/ui/list_item_cards/calls_card/calls_card.dart';
import 'package:project_smm/shared/ui/status_choice_chip/status_choice_chip.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isCall = true;
  int offsetCalls = 0;
  int offsetBrigades = 0;

  final ScrollController scrollController = ScrollController();

  List<int> statusFiltersCalls = [];
  List<int> statusFiltersBrigades = [];

  @override
  void initState() {
    super.initState();
    scrollController.addListener(
      () {
        if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent) {
          context.read<MainPageBloc>().add(MainPageStartLoadingEvent(
              shouldLoadMore: true,
              callsStatus: statusFiltersCalls.map((i) => i.toString()).toList(),
              brigadesStatus:
                  statusFiltersBrigades.map((i) => i.toString()).toList()));
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

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
            return CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: SwitchCallsOrBrigadeItem(
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
                ),
                SliverToBoxAdapter(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 13, vertical: 9),
                      child: Wrap(
                        children: List.generate(
                            isCall
                                ? state.callsStatusesList.length
                                : state.brigadesStatusesList.length, (index) {
                          Color? colorCardSelected;
                          Color? colorCardUnSelected;
                          if (!isCall) {
                            if (state.brigadesStatusesList[index].statusId ==
                                667) {
                              colorCardSelected = ThemeApp.primaryColor;
                              colorCardUnSelected = ThemeApp.secondaryColor;
                            }
                            if (state.brigadesStatusesList[index].statusId ==
                                BrigadesStatuses().brigadeIsFree) {
                              colorCardSelected = ThemeApp.brigadeFreeColor;
                              colorCardUnSelected =
                                  ThemeApp.brigadeFreeLightColor;
                            }
                            if (state.brigadesStatusesList[index].statusId ==
                                BrigadesStatuses().service) {
                              colorCardSelected = ThemeApp.onServiceColor;
                              colorCardUnSelected =
                                  ThemeApp.onServiceLightColor;
                            }
                            if (state.brigadesStatusesList[index].statusId ==
                                BrigadesStatuses().lunch) {
                              colorCardSelected = ThemeApp.breakColor;
                              colorCardUnSelected = ThemeApp.breakLightColor;
                            }
                          }
                          if (state.callsStatusesList[index].statusId == 666) {
                            colorCardSelected = ThemeApp.primaryColor;
                            colorCardUnSelected = ThemeApp.secondaryColor;
                          }
                          if (state.callsStatusesList[index].statusId ==
                              CallStatuses().inQueue) {
                            colorCardSelected = ThemeApp.alarmColor;
                            colorCardUnSelected = ThemeApp.onAlertColorTwo;
                          }
                          if (state.callsStatusesList[index].statusId ==
                              CallStatuses().service) {
                            colorCardSelected = ThemeApp.onServiceColor;
                            colorCardUnSelected = ThemeApp.onServiceLightColor;
                          }
                          if (state.callsStatusesList[index].statusId ==
                              CallStatuses().onHospitalization) {
                            colorCardSelected = ThemeApp.transportationColor;
                            colorCardUnSelected =
                                ThemeApp.transportationLightColor;
                          }
                          if (state.callsStatusesList[index].statusId ==
                              CallStatuses().arrivalAtHospital) {
                            colorCardSelected = ThemeApp.inHospitalColor;
                            colorCardUnSelected = ThemeApp.inHospitalLightColor;
                          }
                          if (state.callsStatusesList[index].statusId ==
                              CallStatuses().onResult) {
                            colorCardSelected = ThemeApp.onResultColor;
                            colorCardUnSelected = ThemeApp.onResultLightColor;
                          }
                          return StatusChoiceChip(
                            isCall: isCall,
                            statusesList: isCall
                                ? state.callsStatusesList[index]
                                : state.brigadesStatusesList[index],
                            colorCardSelected: colorCardSelected,
                            colorCardUnSelected: colorCardUnSelected,
                            statusFilters: isCall
                                ? statusFiltersCalls
                                : statusFiltersBrigades,
                          );
                        }).toList(),
                      )),
                ),
                isCall
                    ? state.calls == []
                        ? const SliverToBoxAdapter(
                            child: Center(
                              child: Text('вызовы не найдены'),
                            ),
                          )
                        : SliverList(
                            delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                              return CallsCard(
                                callsInfo: state.calls?[index],
                              );
                            }, childCount: state.calls?.length),
                          )
                    : state.brigades == []
                        ? const SliverToBoxAdapter(
                            child: Center(
                              child: Text('бригады не найдены'),
                            ),
                          )
                        : SliverList(
                            delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                              return BrigadesCard(
                                brigadesInfo: state.brigades?[index],
                              );
                            }, childCount: state.brigades?.length),
                          ),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
