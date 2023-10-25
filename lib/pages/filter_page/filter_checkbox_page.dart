import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_smm/shared/constants/local_storage/local_storage_constants.dart';
import 'package:project_smm/shared/lib/local_storage/local_storage.dart';
import 'package:project_smm/shared/types/dictionary/dictionary_model.dart';
import 'package:project_smm/shared/ui/form_item/form_item_select_dictionary/filter_checkbox_item.dart';

class FilterCheckboxPage extends StatelessWidget {
  final String appBarName;
  final List<ResultModel> itemsList;
  final List<int> filters;

  const FilterCheckboxPage(
      {super.key,
      required this.appBarName,
      required this.itemsList,
      required this.filters});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: AppBar(
          title: Text(appBarName),
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
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: itemsList.length,
          itemBuilder: (BuildContext context, int index) {
            return FilterCheckboxItem(
              filters: filters,
              itemId: itemsList[index].id!,
              itemName: LocalStorage.getString(
                  AppConstants.LOCALE) ==
                  'ru' ||
                  LocalStorage.getString(
                      AppConstants.LOCALE) ==
                      ''
                  ? itemsList[index].name!
                  : itemsList[index].nameAdd,
            );
          }),
    );
  }
}
