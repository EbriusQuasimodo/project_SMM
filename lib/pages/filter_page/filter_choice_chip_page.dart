import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_smm/entities/filter_entities/filter_bloc/filters_bloc.dart';
import 'package:project_smm/features/filters_change_button/change_filters_widget.dart';
import 'package:project_smm/pages/filter_page/filter_checkbox_page.dart';
import 'package:project_smm/pages/home_page.dart';
import 'package:project_smm/shared/constants/local_storage/local_storage_constants.dart';
import 'package:project_smm/shared/lib/local_storage/local_storage.dart';
import 'package:project_smm/shared/lib/routes/app_routes.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';
import 'package:project_smm/shared/ui/buttons/primary_button/primary_button.dart';
import 'package:project_smm/shared/ui/form_item/form_item_select_dictionary/filter_choice_chip_item.dart';
import 'package:project_smm/widgets/filters_widgets/show_more_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FilterChoiceChipPage extends StatefulWidget {
  bool isCall;
  final String fromWhereOpen;

  FilterChoiceChipPage(
      {super.key, required this.isCall, required this.fromWhereOpen});

  @override
  State<FilterChoiceChipPage> createState() => _FilterChoiceChipPageState();
}

class _FilterChoiceChipPageState extends State<FilterChoiceChipPage> {
  final List<int> priorityList = [1, 2, 3, 4];

  List<int> cacheCityCalls = [];
  List<int> cachePriorityCalls = [];
  List<int> cacheSubstationCalls = [];

  List<int> cacheCityBrigades = [];
  List<int> cacheSubstationBrigades = [];

  @override
  void initState() {
    super.initState();
    if (LocalStorage.getList(AppConstants.CITYSTATIONLISTCALLS).isNotEmpty) {
      for (int i = 0;
      i < LocalStorage.getList(AppConstants.CITYSTATIONLISTCALLS).length;
      i++) {
        List<int> filters =
        LocalStorage.getList(AppConstants.CITYSTATIONLISTCALLS)
            .map((e) => int.parse(e))
            .toList();

        cacheCityCalls.add(filters[i]);
      }
    }
    if (LocalStorage.getList(AppConstants.PRIORITYLISTCALLS).isNotEmpty) {
      for (int i = 0;
      i < LocalStorage.getList(AppConstants.PRIORITYLISTCALLS).length;
      i++) {
        List<int> filters = LocalStorage.getList(AppConstants.PRIORITYLISTCALLS)
            .map((e) => int.parse(e))
            .toList();

        cachePriorityCalls.add(filters[i]);
      }
    }
    if (LocalStorage.getList(AppConstants.SUBSTATIONLISTCALLS).isNotEmpty) {
      for (int i = 0;
      i < LocalStorage.getList(AppConstants.SUBSTATIONLISTCALLS).length;
      i++) {
        List<int> filters =
        LocalStorage.getList(AppConstants.SUBSTATIONLISTCALLS)
            .map((e) => int.parse(e))
            .toList();

        cacheSubstationCalls.add(filters[i]);
      }
    }
    if (LocalStorage.getList(AppConstants.CITYSTATIONLISTBRIGADES).isNotEmpty) {
      for (int i = 0;
      i < LocalStorage.getList(AppConstants.CITYSTATIONLISTBRIGADES).length;
      i++) {
        List<int> filters =
        LocalStorage.getList(AppConstants.CITYSTATIONLISTBRIGADES)
            .map((e) => int.parse(e))
            .toList();

        cacheCityBrigades.add(filters[i]);
      }
    }

    if (LocalStorage.getList(AppConstants.SUBSTATIONLISTBRIGADES).isNotEmpty) {
      for (int i = 0;
      i < LocalStorage.getList(AppConstants.SUBSTATIONLISTBRIGADES).length;
      i++) {
        List<int> filters =
        LocalStorage.getList(AppConstants.SUBSTATIONLISTBRIGADES)
            .map((e) => int.parse(e))
            .toList();

        cacheSubstationBrigades.add(filters[i]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: AppBar(
          title: Text(AppLocalizations.of(context)!.filterPage),
          leading: MaterialButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child:
            SvgPicture.asset('assets/images/icons/shared/arrow_back.svg'),
          ),
          actions: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: MaterialButton(
                onPressed: () {
                  widget.isCall
                      ? setState(() {
                    LocalStorage.setList(
                        AppConstants.CITYSTATIONLISTCALLS, []);

                    LocalStorage.setList(
                        AppConstants.PRIORITYLISTCALLS, []);

                    LocalStorage.setList(
                        AppConstants.SUBSTATIONLISTCALLS, []);
                    cacheCityCalls = [];
                    cachePriorityCalls = [];
                    cacheSubstationCalls = [];
                  })
                      : setState(() {
                    LocalStorage.setList(
                        AppConstants.CITYSTATIONLISTBRIGADES, []);

                    LocalStorage.setList(
                        AppConstants.SUBSTATIONLISTBRIGADES, []);
                    cacheCityBrigades = [];
                    cacheSubstationBrigades = [];
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side:
                  const BorderSide(color: ThemeApp.primaryColor, width: 2),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    'сброс',
                    style: TextStyle(color: ThemeApp.primaryColor),
                  ),
                ),
              ),
            )
          ],
          titleSpacing: 0,
        ),
      ),
      body: BlocBuilder<FiltersBloc, FiltersState>(
        builder: (context, state) {
          if (state is FiltersDoneState) {
            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(top: 12, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ChoiceFilterType(
                      isCall: widget.isCall,
                      onTapBrigadeButton: () {
                        setState(() {
                          widget.isCall = false;
                        });
                      },
                      onTapCallButton: () {
                        setState(() {
                          widget.isCall = true;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16, bottom: 12, left: 16, right: 16),
                      child: Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.city,
                            style: const TextStyle(
                                color: ThemeApp.secondaryColorTextAndIcons,
                                fontWeight: FontWeight.w400,
                                fontSize: 22),
                          ),
                          const Spacer(),
                          state.cityStations.length > 6
                              ? ShowMoreButton(onTap: () {
                            Navigator.of(context)
                                .push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    FilterCheckboxPage(
                                      appBarName:
                                      AppLocalizations.of(context)!
                                          .city,
                                      itemsList: state.cityStations,
                                      filters: widget.isCall
                                          ? cacheCityCalls
                                          : cacheCityBrigades,
                                    ),
                              ),
                            )
                                .then((value) => setState(() {}));
                          })
                              : const SizedBox.shrink(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 13, right: 13),
                      child: Wrap(
                        children: List.generate(
                            state.cityStations.length > 6
                                ? 6
                                : state.cityStations.length, (index) {
                          return Padding(
                              padding: const EdgeInsets.only(left: 3, right: 3),
                              child: FilterChipItem(
                                itemName: LocalStorage.getString(
                                    AppConstants.LOCALE) ==
                                    'ru' ||
                                    LocalStorage.getString(
                                        AppConstants.LOCALE) ==
                                        ''
                                    ? state.cityStations[index].name
                                    : state.cityStations[index].nameAdd,
                                itemId: state.cityStations[index].id,
                                filters: widget.isCall
                                    ? cacheCityCalls
                                    : cacheCityBrigades,
                              ));
                        }).toList(),
                      ),
                    ),
                    widget.isCall
                        ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 16, bottom: 12, left: 16, right: 16),
                          child: Text(
                            AppLocalizations.of(context)!.priority,
                            style: const TextStyle(
                                color:
                                ThemeApp.secondaryColorTextAndIcons,
                                fontWeight: FontWeight.w400,
                                fontSize: 22),
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.only(left: 13, right: 13),
                          child: Wrap(
                            children: List.generate(priorityList.length,
                                    (index) {
                                  return Padding(
                                      padding: const EdgeInsets.only(
                                          left: 3, right: 3),
                                      child: FilterChipItem(
                                        itemName:
                                        priorityList[index].toString(),
                                        itemId: priorityList[index],
                                        filters: cachePriorityCalls,
                                      ));
                                }).toList(),
                          ),
                        ),
                      ],
                    )
                        : const SizedBox.shrink(),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16, bottom: 12, left: 16, right: 16),
                      child: Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.substation,
                            style: const TextStyle(
                                color: ThemeApp.secondaryColorTextAndIcons,
                                fontWeight: FontWeight.w400,
                                fontSize: 22),
                          ),
                          const Spacer(),
                          state.substations.length > 6 /// .where
                              ? ShowMoreButton(onTap: () {
                            Navigator.of(context)
                                .push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    FilterCheckboxPage(
                                      appBarName:
                                      AppLocalizations.of(context)!
                                          .substation,
                                      itemsList: state.substations, // (.where)
                                      filters: widget.isCall
                                          ? cacheSubstationCalls
                                          : cacheSubstationBrigades,
                                    ),
                              ),
                            )
                                .then((value) => setState(() {}));
                          })
                              : const SizedBox.shrink(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 13, right: 13),
                      child: Wrap(
                        children: List.generate(
                            state.substations.length > 6 /// .where
                                ? 6
                                : state.substations.length, (index) {
                          return Padding(
                              padding: const EdgeInsets.only(left: 3, right: 3),
                              child: FilterChipItem(
                                itemName: LocalStorage.getString(
                                    AppConstants.LOCALE) ==
                                    'ru' ||
                                    LocalStorage.getString(
                                        AppConstants.LOCALE) ==
                                        ''
                                    ? state.substations[index].name
                                    : state.substations[index].nameAdd,
                                itemId: state.substations[index].id!,
                                filters: widget.isCall
                                    ? cacheSubstationCalls
                                    : cacheSubstationBrigades,
                              ));
                        }).toList(),
                      ),
                    ),
                    PrimaryButton(
                        onTap: () {
                          LocalStorage.setList(
                              AppConstants.CITYSTATIONLISTCALLS,
                              cacheCityCalls.map((i) => i.toString()).toList());

                          LocalStorage.setList(
                              AppConstants.PRIORITYLISTCALLS,
                              cachePriorityCalls
                                  .map((i) => i.toString())
                                  .toList());

                          LocalStorage.setList(
                              AppConstants.SUBSTATIONLISTCALLS,
                              cacheSubstationCalls
                                  .map((i) => i.toString())
                                  .toList());
                          LocalStorage.setList(
                              AppConstants.CITYSTATIONLISTBRIGADES,
                              cacheCityBrigades
                                  .map((i) => i.toString())
                                  .toList());

                          LocalStorage.setList(
                              AppConstants.SUBSTATIONLISTBRIGADES,
                              cacheSubstationBrigades
                                  .map((i) => i.toString())
                                  .toList());

                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) {
                                if (widget.fromWhereOpen == AppRoutes.reports) {
                                  return HomePage(
                                    selectedPage: 3,
                                  );
                                } else if (widget.fromWhereOpen ==
                                    AppRoutes.analytics) {
                                  return HomePage(
                                    selectedPage: 1,
                                  );
                                }
                                return HomePage(
                                  selectedPage: 0,
                                );
                              }), (route) => false);
                        },
                        buttonName: AppLocalizations.of(context)!.submit),
                  ],
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}