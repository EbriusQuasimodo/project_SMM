import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_smm/entities/filter_entities/filter_bloc/filters_bloc.dart';
import 'package:project_smm/shared/constants/local_storage/local_storage_constants.dart';
import 'package:project_smm/shared/lib/local_storage/local_storage.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';
import 'package:project_smm/shared/ui/buttons/primary_button/primary_button.dart';
import 'package:project_smm/shared/ui/form_item/form_item_select_dictionary/ui/filter_choice_chip_item.dart';

class SubstationsByCity {
  const SubstationsByCity({
    required this.name,
    required this.id,
  });

  final int id;
  final String name;
}

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  bool isCall = true;
  final List<int> priorityList = [1, 2, 3, 4];
  List<int> substations = [];
  List<String> substationsName = [];

  List<int> cacheCity = [];
  List<int> cachePriority = [];
  List<int> cacheSubstation = [];
  List<String> cacheSubstationsName = [];

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

        cacheSubstationsName
            .add(LocalStorage.getList(AppConstants.SUBSTATIONLISTNAME)[i]);
        cacheSubstation.add(filters[i]);
      }
    }

    print('123213 e rewrewr  $cacheSubstation');
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
                    LocalStorage.setList(AppConstants.SUBSTATIONLISTNAME, []);
                    cacheCity = [];
                    cachePriority = [];
                    cacheSubstation = [];
                    cacheSubstationsName = [];
                    substations = [];
                    substationsName = [];
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: const BorderSide(color: ThemeApp.primaryColor, width: 2),
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
            List<int> tempSubstationsIdList = [];
            List<String> tempSubstationsNameList = [];
            if (cacheSubstation.isNotEmpty) {
              for (int i = 0; i < cacheSubstation.length; i++) {
                tempSubstationsIdList.add(cacheSubstation[i]);

              }
            }
            if (cacheSubstationsName.isNotEmpty) {
              for (int i = 0; i < cacheSubstationsName.length; i++) {
                tempSubstationsNameList.add(cacheSubstationsName[i]);
              }
            }
            if (cacheCity.isNotEmpty) {
              for (int i = 0; i < state.substations.length; i++) {
                if (cacheCity.contains(state.substations[i].cityStation!.id)) {
                  tempSubstationsIdList.add(state.substations[i].id!);
                  tempSubstationsNameList.add(state.substations[i].name!);

                } else if (!cacheCity
                        .contains(state.substations[i].cityStation!.id) &&
                    cacheSubstation.isEmpty) {
                  tempSubstationsIdList.removeWhere((int id) {
                    return id == state.substations[i].id!;
                  });
                  tempSubstationsNameList.removeWhere((String name) {
                    return name == state.substations[i].name!;
                  });
                }
              }
              substationsName = tempSubstationsNameList.toSet().toList();
              substations = tempSubstationsIdList.toSet().toList();
              print(substations);
              print(substationsName);
            }
            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(top: 12, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: MaterialButton(
                              onPressed: () {
                                setState(() {
                                  isCall = true;
                                });
                              },
                              child: const Text('Вызов'),
                            ),
                          ),
                          Expanded(
                            child: MaterialButton(
                              onPressed: () {
                                setState(() {
                                  isCall = false;
                                });
                              },
                              child: const Text('Бригада'),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                          top: 16, bottom: 12, left: 16, right: 16),
                      child: Text(
                        'Город',
                        style: TextStyle(
                            color: ThemeApp.secondaryColorTextAndIcons,
                            fontWeight: FontWeight.w400,
                            fontSize: 22),
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
                                onCityChoice: () {
                                  List<int> tempSubstationsIdList = [];
                                  List<String> tempSubstationsNameList = [];

                                  for (int i = 0;
                                      i < state.substations.length;
                                      i++) {
                                    if (cacheCity.contains(
                                        state.substations[i].cityStation!.id)) {
                                      setState(() {
                                        tempSubstationsIdList
                                            .add(state.substations[i].id!);
                                        tempSubstationsNameList
                                            .add(state.substations[i].name!);
                                      });
                                    } else if (!cacheCity.contains(state
                                            .substations[i].cityStation!.id) &&
                                        cacheSubstation.isEmpty) {
                                      setState(() {
                                        tempSubstationsIdList
                                            .removeWhere((int id) {
                                          return id == state.substations[i].id!;
                                        });
                                        tempSubstationsNameList
                                            .removeWhere((String name) {
                                          return name ==
                                              state.substations[i].name!;
                                        });
                                      });
                                    }
                                  }
                                  if (cacheSubstation.isNotEmpty) {
                                    for (int i = 0; i < cacheSubstation.length; i++) {
                                      tempSubstationsIdList.add(cacheSubstation[i]);

                                    }
                                  }
                                  if (cacheSubstationsName.isNotEmpty) {
                                    for (int i = 0; i < cacheSubstationsName.length; i++) {
                                      tempSubstationsNameList.add(cacheSubstationsName[i]);
                                    }
                                  }
                                  substationsName =
                                      tempSubstationsNameList.toSet().toList();
                                  substations =
                                      tempSubstationsIdList.toSet().toList();
                                },
                              ));
                        }).toList(),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                          top: 16, bottom: 12, left: 16, right: 16),
                      child: Text(
                        'Срочность',
                        style: TextStyle(
                            color: ThemeApp.secondaryColorTextAndIcons,
                            fontWeight: FontWeight.w400,
                            fontSize: 22),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 13, right: 13),
                      child: Wrap(
                        children: List.generate(priorityList.length, (index) {
                          return Padding(
                              padding: const EdgeInsets.only(left: 3, right: 3),
                              child: FilterChipItem(
                                itemName: priorityList[index].toString(),
                                itemId: priorityList[index],
                                filters: cachePriority,
                                onCityChoice: () {},
                              ));
                        }).toList(),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                          top: 16, bottom: 12, left: 16, right: 16),
                      child: Text(
                        'Подстанция',
                        style: TextStyle(
                            color: ThemeApp.secondaryColorTextAndIcons,
                            fontWeight: FontWeight.w400,
                            fontSize: 22),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 13, right: 13),
                      child: Wrap(
                        children: List.generate(
                            substations.isNotEmpty && substations.length < 6
                                ? substations.length
                                : 6, (index) {
                          return Padding(
                              padding: const EdgeInsets.only(left: 3, right: 3),
                              child: FilterChipItem(
                                itemName: substations.isNotEmpty
                                    ? substationsName[index]
                                    : state.substations[index].name,
                                itemId: substations.isNotEmpty
                                    ? substations[index]
                                    : state.substations[index].id!,
                                filters: cacheSubstation,
                                onCityChoice: () {},
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
                          LocalStorage.setList(
                              AppConstants.SUBSTATIONLISTNAME, substationsName);
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
