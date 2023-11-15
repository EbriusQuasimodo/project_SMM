import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_smm/entities/main_page_entities/main_page_bloc/main_page_bloc.dart';
import 'package:project_smm/entities/types/search_model/search_model.dart';
import 'package:project_smm/features/calls_list_or_brigades_list/change_list_widget.dart';
import 'package:project_smm/shared/constants/local_storage/local_storage_constants.dart';
import 'package:project_smm/shared/lib/local_storage/local_storage.dart';
import 'package:project_smm/shared/lib/routes/app_routes.dart';
import 'package:project_smm/shared/lib/statuses/brigades_statuses.dart';
import 'package:project_smm/shared/lib/statuses/calls_statuses.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';
import 'package:project_smm/shared/ui/custom_dialogs/custom_dialog_with_two_buttons/custom_dialog_with_two_buttons.dart';
import 'package:project_smm/shared/ui/list_item_cards/brigades_card/brigades_card.dart';
import 'package:project_smm/shared/ui/list_item_cards/calls_card/calls_card.dart';
import 'package:project_smm/shared/ui/status_choice_chip/status_choice_chip.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainPageBodyWidget extends StatefulWidget {
  bool isCall;
  final VoidCallback onTapCallButton;
  final VoidCallback onTapBrigadeButton;
  SearchModel? searchModel;
  MainPageBodyWidget(
      {super.key,
        this.searchModel,
      required this.isCall,
      required this.onTapCallButton,
      required this.onTapBrigadeButton});

  @override
  State<MainPageBodyWidget> createState() => _MainPageBodyWidgetState();
}

class _MainPageBodyWidgetState extends State<MainPageBodyWidget> {
  final ScrollController scrollController = ScrollController();

  List<int> statusFiltersCalls = [666];
  List<int> statusFiltersBrigades = [667];

  int offsetCalls = 0;
  int offsetBrigades = 0;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(
      () {
        if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent) {
          context.read<MainPageBloc>().add(MainPageStartLoadingEvent(
              shouldLoadMore: true,
              callsStatus: statusFiltersCalls,
              brigadesStatus:
                  statusFiltersBrigades,
            searchModel: widget.searchModel
          ));
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
    return BlocBuilder<MainPageBloc, MainPageState>(
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
        } else if (state is MainPageDoneState) {
          return CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: SwitchCallsOrBrigadeItem(
                  allCountsCalls: state.allCountCalls,
                  allCountsBrigades: state.allCountBrigades,
                  isCall: widget.isCall,
                  onTapCallButton: () {
                    widget.onTapCallButton();
                  },
                  onTapBrigadeButton: () {
                    widget.onTapBrigadeButton();
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 13, vertical: 9),
                    child: Wrap(
                      children: List.generate(
                          widget.isCall
                              ? state.callsStatusesList.length
                              : state.brigadesStatusesList.length, (index) {
                        Color? colorCardSelected;
                        Color? colorCardUnSelected;
                        if (!widget.isCall) {
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
                            colorCardUnSelected = ThemeApp.onServiceLightColor;
                          }
                          if (state.brigadesStatusesList[index].statusId ==
                              BrigadesStatuses().lunch) {
                            colorCardSelected = ThemeApp.breakColor;
                            colorCardUnSelected = ThemeApp.breakLightColor;
                          }
                        }
                        if(state.callsStatusesList[index].statusId == 2){
                          colorCardSelected = ThemeApp.arrivalColor;
                          colorCardUnSelected = ThemeApp.arrivalLightColor;
                        }
                        if (state.callsStatusesList[index].statusId == 666) {
                          colorCardSelected = ThemeApp.primaryColor;
                          colorCardUnSelected = ThemeApp.secondaryColor;
                        }
                        if (state.callsStatusesList[index].statusId ==
                            CallStatuses().inQueue) {
                          colorCardSelected = ThemeApp.queueColor;
                          colorCardUnSelected = ThemeApp.onAlertColorTwo;
                        }
                        if (state.callsStatusesList[index].statusId ==
                            CallStatuses().service) {
                          colorCardSelected = ThemeApp.onServiceColor;
                          colorCardUnSelected = ThemeApp.onServiceLightColor;
                        }
                        if (state.callsStatusesList[index].statusId ==
                            CallStatuses().onHospitalization) {
                          colorCardSelected = ThemeApp.hospitalizationColor;
                          colorCardUnSelected =
                              ThemeApp.hospitalizationLightColor;
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
                          searchModel: widget.searchModel,
                          isCall: widget.isCall,
                          statusesList: widget.isCall
                              ? state.callsStatusesList[index]
                              : state.brigadesStatusesList[index],
                          colorCardSelected: colorCardSelected,
                          colorCardUnSelected: colorCardUnSelected,
                          statusFilters: widget.isCall
                              ? statusFiltersCalls
                              : statusFiltersBrigades,
                        );
                      }).toList(),
                    )),
              ),
              widget.isCall
                  ? state.calls!.isEmpty
                      ? const SliverToBoxAdapter(
                          child: Center(
                            child: Text('вызовы не найдены'),
                          ),
                        )
                      : SliverList(
                          delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                            return CallsCard(
                              isFavouritePage: false,
                              onTapFavouriteButton: () {
                                state.calls![index].isFavorite!
                                    ? showDialog(
                                  context: context,
                                  builder: (builder) => CustomDialogWithTwoButtons(
                                    title: AppLocalizations.of(context)!.deleteItemFromFavorite(AppLocalizations.of(context)!.call, "${state.calls?[index].id}"),
                                    onTapFirstButton: () {
                                      Navigator.of(context).pop();
                                    },
                                    onTapSecondButton: () {
                                      context.read<MainPageBloc>().add(
                                        MainPageDeleteFavouritesEvent(
                                          whatDelete: 'calls',
                                          id: state.calls?[index].id,
                                        ),
                                      );
                                      Navigator.of(context).pop();
                                      context.read<MainPageBloc>().add(
                                          MainPageStartLoadingEvent(
                                              shouldLoadMore: false,
                                              callsStatus: statusFiltersCalls,
                                              brigadesStatus: statusFiltersBrigades));
                                    },
                                  ),
                                )
                                    : addToFavorite(state.calls![index].id);
                              },
                              callsInfo: state.calls?[index],
                            );
                          }, childCount: state.calls?.length),
                        )
                  : state.brigades!.isEmpty
                      ? const SliverToBoxAdapter(
                          child: Center(
                            child: Text('бригады не найдены'),
                          ),
                        )
                      : SliverList(
                          delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                            return BrigadesCard(
                              index: index,
                              isFavouritePage: false,
                              onTapFavouriteButton: () {
                                state.brigades![index].isFavorite!
                                    ? context.read<MainPageBloc>().add(
                                  MainPageDeleteFavouritesEvent(
                                    whatDelete: 'brigades',
                                    id: state.brigades?[index].id,
                                  ),
                                )
                                    : context.read<MainPageBloc>().add(
                                  MainPageAddFavouritesEvent(
                                    whatAdd: 'brigades',
                                    id: state.brigades?[index].id,
                                  ),
                                );
                                context.read<MainPageBloc>().add(
                                    MainPageStartLoadingEvent(
                                        shouldLoadMore: false,
                                        callsStatus: statusFiltersCalls,
                                        brigadesStatus: statusFiltersBrigades));
                              },
                              brigadesInfo: state.brigades?[index],
                            );
                          }, childCount: state.brigades?.length),
                        ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
  void addToFavorite(int id){
    context.read<MainPageBloc>().add(
      MainPageAddFavouritesEvent(
        whatAdd: 'calls',
        id: id,
      ),
    );
    context.read<MainPageBloc>().add(
        MainPageStartLoadingEvent(
            shouldLoadMore: false,
            callsStatus: statusFiltersCalls,
            brigadesStatus: statusFiltersBrigades));
  }
}
