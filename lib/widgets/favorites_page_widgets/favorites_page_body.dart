import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_smm/entities/favourites_entities/favourites_bloc/favourites_bloc.dart';
import 'package:project_smm/entities/types/search_model/search_model.dart';
import 'package:project_smm/features/calls_list_or_brigades_list/change_list_widget.dart';
import 'package:project_smm/shared/constants/local_storage/local_storage_constants.dart';
import 'package:project_smm/shared/lib/local_storage/local_storage.dart';
import 'package:project_smm/shared/lib/routes/app_routes.dart';
import 'package:project_smm/shared/ui/custom_dialogs/custom_dialog_with_two_buttons/custom_dialog_with_two_buttons.dart';
import 'package:project_smm/shared/ui/list_item_cards/brigades_card/brigades_card.dart';
import 'package:project_smm/shared/ui/list_item_cards/calls_card/calls_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavouritesPageBodyWidget extends StatefulWidget {
  bool isCall;
  final VoidCallback onTapCallButton;
  final VoidCallback onTapBrigadeButton;
  SearchModel? searchModel;

  FavouritesPageBodyWidget(
      {super.key,
        this.searchModel,
      required this.isCall,
      required this.onTapCallButton,
      required this.onTapBrigadeButton});

  @override
  State<FavouritesPageBodyWidget> createState() =>
      _FavouritesPageBodyWidgetState();
}

class _FavouritesPageBodyWidgetState extends State<FavouritesPageBodyWidget> {
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
          context.read<FavouritesBloc>().add(FavouritesPageStartLoadingEvent(
                shouldLoadMore: true,
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
    return BlocBuilder<FavouritesBloc, FavouritesState>(
      builder: (context, state) {
        if (state is FavouritesPageLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is FavouritesPageLogoutState) {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushNamed(
              AppRoutes.auth,
            );
            LocalStorage.setString(AppConstants.TOKEN, '');
          });
        } else if (state is FavouritesPageFailedState) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is FavouritesPageDoneState) {
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
                              isFavouritePage: true,
                              onTapFavouriteButton: () {
                                showDialog(
                                  context: context,
                                  builder: (builder) =>
                                      CustomDialogWithTwoButtons(
                                    title: AppLocalizations.of(context)!
                                        .deleteItemFromFavorite(
                                            AppLocalizations.of(context)!.call,
                                            "${state.calls?[index].dayNumber}"),
                                    onTapFirstButton: () {
                                      Navigator.of(context).pop();
                                    },
                                    onTapSecondButton: () {
                                      context.read<FavouritesBloc>().add(
                                            FavouritesPageDeleteEvent(
                                              whatDelete: 'calls',
                                              id: state.calls?[index].id,
                                            ),
                                          );
                                      Navigator.of(context).pop();
                                      context
                                          .read<FavouritesBloc>()
                                          .add(FavouritesPageStartLoadingEvent(
                                            shouldLoadMore: false,
                                          ));
                                    },
                                  ),
                                );
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
                              dayNumber: state.brigades![index].calls?[0].dayNumber,
                              index: index,
                              isFavouritePage: true,
                              onTapFavouriteButton: () {
                                showDialog(
                                  context: context,
                                  builder: (builder) => CustomDialogWithTwoButtons(
                                    title: 'Удалить Бригаду ${state.brigades![index].brigade?.number} из избранного?',
                                    onTapFirstButton: () {
                                      Navigator.of(context).pop();
                                    },
                                    onTapSecondButton: () {
                                      context.read<FavouritesBloc>().add(
                                        FavouritesPageDeleteEvent(
                                          whatDelete: 'brigades',
                                          id: state.brigades?[index].id,
                                        ),
                                      );
                                      Navigator.of(context).pop();
                                      context.read<FavouritesBloc>().add(
                                          FavouritesPageStartLoadingEvent(
                                              shouldLoadMore: false,));
                                    },
                                  ),
                                );
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
}
