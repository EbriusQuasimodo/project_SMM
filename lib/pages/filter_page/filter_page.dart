import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_smm/entities/filter_entities/filter_bloc/filters_bloc.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';
import 'package:project_smm/shared/ui/form_item/form_item_select_dictionary/ui/filter_choice_chip_item.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  bool isCall = true;
  final List<int> _cityFilters = <int>[];
  final List<int> _priorityFilters = <int>[];
  final List<int> _substationFilters = <int>[];
  final List<int> priorityList = [1, 2, 3, 4];
  final List<String> substations = [];

  bool isCitySelected = false;

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
            print('city $_cityFilters');
            print('pr $_priorityFilters');
            print('sub $_substationFilters');

            print(substations);

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
                                  itemId:
                                      state.cityStations[index].id,
                                  filters: _cityFilters, onCityChoice: (){
                                    for (int i = 0; i < state.substations.length; i++) {
                                if (_cityFilters.contains(state.cityStations[index].id)) {
                                  setState(() {
                                    substations.add(state.substations[index].name!);
                                    isCitySelected ? isCitySelected = false : isCitySelected = true;
                                  });
                                }
                              }},));
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
                                  filters: _priorityFilters));
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
                        children: List.generate(6, (index) {
                          return Padding(
                              padding: const EdgeInsets.only(left: 3, right: 3),
                              child: FilterChipItem(
                                  itemName: isCitySelected
                                      ? substations[index]
                                      : state.substations[index].name!,
                                  itemId: state.substations[index].id!,
                                  filters: _substationFilters));
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
    );
  }
}
