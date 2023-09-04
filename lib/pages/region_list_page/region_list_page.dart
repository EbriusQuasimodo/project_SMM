import 'package:flutter/material.dart';
import 'package:project_smm/shared/ui/app_bars/app_bar_with_leading_and_title/app_bar_with_leading_and_title.dart';
import 'package:project_smm/widgets/region_list_widgets/region_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegionListPage extends StatelessWidget {
  const RegionListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithLeadingAndTitle(
          titleText: AppLocalizations.of(context)!.choiceRegion,
          onTap: () {
            Navigator.of(context).pop();
          }),
      body: const RegionList(),
    );
  }
}
