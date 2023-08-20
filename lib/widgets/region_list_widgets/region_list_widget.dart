import 'package:flutter/material.dart';
import 'package:project_smm/shared/ui/app_bar_items/app_bar_with_leading_and_title/app_bar_with_leading_and_title.dart';
import 'package:project_smm/widgets/region_list_widgets/region_list.dart';

class RegionListWidget extends StatelessWidget {
  const RegionListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithLeadingAndTitle(
          titleText: 'Выбор региона',
          onTap: () {
            Navigator.of(context).pop();
          }),
      body: const RegionList(),
    );
  }
}
