import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_smm/entities/filter_entities/filter_bloc/filters_bloc.dart';
import 'package:project_smm/features/filters_change_button/change_filters_widget.dart';
import 'package:project_smm/pages/filter_page/filter_checkbox_page.dart';
import 'package:project_smm/shared/constants/local_storage/local_storage_constants.dart';
import 'package:project_smm/shared/lib/local_storage/local_storage.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';
import 'package:project_smm/shared/ui/buttons/primary_button/primary_button.dart';
import 'package:project_smm/shared/ui/form_item/form_item_select_dictionary/ui/filter_choice_chip_item.dart';
import 'package:project_smm/widgets/filters_widgets/show_more_button.dart';

class FilterChoiceChipPage extends StatefulWidget {
  const FilterChoiceChipPage({super.key});

  @override
  State<FilterChoiceChipPage> createState() => _FilterChoiceChipPageState();
}

class _FilterChoiceChipPageState extends State<FilterChoiceChipPage> {
  bool isCall = true;
  final List<int> priorityList = [1, 2, 3, 4];

  List<int> cacheCity = [];
  List<int> cachePriority = [];
  List<int> cacheSubstation = [];

  @override
  void initState() {
    super.initState();
    if (LocalStorage.getList(AppConstants.CITYSTATIONLIST).isNotEmpty) {
      for (int i = 0;
          i < LocalStorage.getList(AppConstants.CITYSTATIONLIST).length;
          i++) {
        List<int> filters = LocalStorage.getList(AppConstants.CITYSTATIONLIST)
            .map((e) => int.parse(e))
            .toList();

        cacheCity.add(filters[i]);
      }
    }
    if (LocalStorage.getList(AppConstants.PRIORITYLIST).isNotEmpty) {
      for (int i = 0;
          i < LocalStorage.getList(AppConstants.PRIORITYLIST).length;
          i++) {
        List<int> filters = LocalStorage.getList(AppConstants.PRIORITYLIST)
            .map((e) => int.parse(e))
            .toList();

        cachePriority.add(filters[i]);
      }
    }
    if (LocalStorage.getList(AppConstants.SUBSTATIONLISTID).isNotEmpty) {
      for (int i = 0;
          i < LocalStorage.getList(AppConstants.SUBSTATIONLISTID).length;
          i++) {
        List<int> filters = LocalStorage.getList(AppConstants.SUBSTATIONLISTID)
            .map((e) => int.parse(e))
            .toList();

        cacheSubstation.add(filters[i]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: AppBar(
          title: const Text('Фильтр'),
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
                  setState(() {
                    LocalStorage.setList(AppConstants.CITYSTATIONLIST, []);

                    LocalStorage.setList(AppConstants.PRIORITYLIST, []);

                    LocalStorage.setList(AppConstants.SUBSTATIONLISTID, []);
                    cacheCity = [];
                    cachePriority = [];
                    cacheSubstation = [];
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
                      isCall: isCall,
                      onTapBrigadeButton: () {
                        setState(() {
                          isCall = false;
                        });
                      },
                      onTapCallButton: () {
                        setState(() {
                          isCall = true;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16, bottom: 12, left: 16, right: 16),
                      child: Row(
                        children: [
                          const Text(
                            'Город',
                            style: TextStyle(
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
                                            appBarName: 'Город вызова',
                                            itemsList: state.cityStations,
                                            filters: cacheCity,
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
                        children: List.generate(6, (index) {
                          return Padding(
                              padding: const EdgeInsets.only(left: 3, right: 3),
                              child: FilterChipItem(
                                itemName: state.cityStations[index].name,
                                itemId: state.cityStations[index].id,
                                filters: cacheCity,
                              ));
                        }).toList(),
                      ),
                    ),
                    isCall
                        ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(
                                    top: 16, bottom: 12, left: 16, right: 16),
                                child: Text(
                                  'Срочность',
                                  style: TextStyle(
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
                                          filters: cachePriority,
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
                          const Text(
                            'Подстанция',
                            style: TextStyle(
                                color: ThemeApp.secondaryColorTextAndIcons,
                                fontWeight: FontWeight.w400,
                                fontSize: 22),
                          ),
                          const Spacer(),
                          state.substations.length > 6
                              ? ShowMoreButton(onTap: () {
                                  Navigator.of(context)
                                      .push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              FilterCheckboxPage(
                                            appBarName: 'Подстанция вызова',
                                            itemsList: state.substations,
                                            filters: cacheSubstation,
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
                        children: List.generate(6, (index) {
                          return Padding(
                              padding: const EdgeInsets.only(left: 3, right: 3),
                              child: FilterChipItem(
                                itemName: state.substations[index].name,
                                itemId: state.substations[index].id!,
                                filters: cacheSubstation,
                              ));
                        }).toList(),
                      ),
                    ),
                    PrimaryButton(
                        onTap: () {
                          LocalStorage.setList(AppConstants.CITYSTATIONLIST,
                              cacheCity.map((i) => i.toString()).toList());

                          LocalStorage.setList(AppConstants.PRIORITYLIST,
                              cachePriority.map((i) => i.toString()).toList());

                          LocalStorage.setList(
                              AppConstants.SUBSTATIONLISTID,
                              cacheSubstation
                                  .map((i) => i.toString())
                                  .toList());
                          Navigator.of(context).pop();
                        },
                        buttonName: 'Подтвердить'),
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
