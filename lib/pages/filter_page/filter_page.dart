import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_smm/entities/filter_entities/filter_bloc/filters_bloc.dart';
import 'package:project_smm/shared/constants/local_storage/local_storage_constants.dart';
import 'package:project_smm/shared/lib/local_storage/local_storage.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';
import 'package:project_smm/shared/ui/buttons/primary_button/primary_button.dart';
import 'package:project_smm/shared/ui/form_item/form_item_select_dictionary/ui/filter_choice_chip_item.dart';

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

  bool isCitySelected = false;

  List<String> cacheCity = LocalStorage.getList(AppConstants.CITYSTATIONLIST);
  List<int> cacheCityContent = [];
  List<String> cachePriority = LocalStorage.getList(AppConstants.PRIORITYLIST);
  List<int> cachePriorityContent = [];
  List<String> cacheSubstation = LocalStorage.getList(AppConstants.SUBSTATIONLIST);
  List<int> cacheSubstationContent = [];

  void saveFilters(List<int> filters, String filtersName){
    List<String> stringsList=  filters.map((i)=>i.toString()).toList();
    LocalStorage.setList(filtersName, stringsList);
  }

  @override
  void initState(){
    super.initState();
    if(cacheCity.isNotEmpty){
      for(int i = 0;
      i < cacheCity.length;
      i++){
        List <int> filters = cacheCity.map((e) => int.parse(e)).toList();

        cacheCityContent.add(filters[i]);
      }
    }
    if(cachePriority.isNotEmpty){
      for(int i = 0;
      i < cachePriority.length;
      i++){
        List <int> filters = cachePriority.map((e) => int.parse(e)).toList();

        cachePriorityContent.add(filters[i]);
      }
    }
    if(cacheSubstation.isNotEmpty){
      for(int i = 0;
      i < cacheSubstation.length;
      i++){
        List <int> filters = cacheSubstation.map((e) => int.parse(e)).toList();

        cacheSubstationContent.add(filters[i]);
      }
    }

    print ('123213 e rewrewr  $cacheSubstationContent');
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
          titleSpacing: 0,
        ),
      ),
      body: BlocBuilder<FiltersBloc, FiltersState>(
        builder: (context, state) {
          if (state is FiltersDoneState) {
            if(cacheCityContent.isNotEmpty){
              List<int> substationsList = [];
              List<String> substationsNameList = [];
              for (int i = 0;
              i < state.substations.length;
              i++) {
                if (cacheCityContent.contains(
                    state.substations[i].cityStation!.id)) {
                  //setState(() {
                    substationsList
                        .add(state.substations[i].id!);
                    substationsNameList
                        .add(state.substations[i].name!);
                 // });
                } else if (!cacheCityContent
                    .contains(state.substations[i].cityStation!.id)) {
                //  setState(() {
                    substationsList.removeWhere((int id) {
                      return id == state.substations[i].id!;
                    });
                    substationsNameList
                        .removeWhere((String name) {
                      return name ==
                          state.substations[i].name!;
                  //  });
                  });
                }
              }
              substationsName = substationsNameList.toSet().toList();
              substations = substationsList.toSet().toList();
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
                      child: Text('Город'),
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
                                filters: cacheCityContent,
                                onCityChoice: () {
                                  List<int> substationsList = [];
                                  List<String> substationsNameList = [];
                                  for (int i = 0;
                                      i < state.substations.length;
                                      i++) {
                                    if (cacheCityContent.contains(
                                        state.substations[i].cityStation!.id)) {
                                      setState(() {
                                        substationsList
                                            .add(state.substations[i].id!);
                                        substationsNameList
                                            .add(state.substations[i].name!);
                                      });
                                    } else if (!cacheCityContent
                                        .contains(state.substations[i].cityStation!.id)) {
                                      setState(() {
                                        substationsList.removeWhere((int id) {
                                          return id == state.substations[i].id!;
                                        });
                                        substationsNameList
                                            .removeWhere((String name) {
                                          return name ==
                                              state.substations[i].name!;
                                        });
                                      });
                                    }
                                  }
                                  substationsName = substationsNameList.toSet().toList();
                                  substations = substationsList.toSet().toList();
                                  print(substationsName);
                                 // print(substationsName);
                                },
                              ));
                        }).toList(),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                          top: 16, bottom: 12, left: 16, right: 16),
                      child: Text('Срочность'),
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
                                filters: cachePriorityContent,
                                onCityChoice: () {},
                              ));
                        }).toList(),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                          top: 16, bottom: 12, left: 16, right: 16),
                      child: Text('Подстанция'),
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
                                filters: cacheSubstationContent,
                                onCityChoice: () {},
                              ));
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: PrimaryButton(onTap: (){
        LocalStorage.setList(AppConstants.CITYSTATIONLIST, cacheCityContent.map((i)=>i.toString()).toList());

        LocalStorage.setList(AppConstants.PRIORITYLIST, cachePriorityContent.map((i)=>i.toString()).toList());

        LocalStorage.setList(AppConstants.SUBSTATIONLIST, cacheSubstationContent.map((i)=>i.toString()).toList());

      }, buttonName: 'Подтвердить'),
    );
  }
}
