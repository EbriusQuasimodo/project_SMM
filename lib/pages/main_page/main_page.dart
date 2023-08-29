import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(64),
          child: AppBar(
            title: Text(AppLocalizations.of(context)!.mainPage),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: ThemeApp.secondaryColorTextAndIcons,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/images/icons/shared/filter.svg'),
              )
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 16, right: 16, top: 12),
              height: 36,
              child: Row(
                children: [
                  Expanded(
                      child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8)),
                          child: MaterialButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/images/icons/shared/phone.svg'),
                                Text('Вызовы'),
                              ],
                            ),
                          ))),
                  Expanded(
                      child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8)),
                          child: MaterialButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/images/icons/shared/car.svg'),
                                Text('Бригады'),
                              ],
                            ),
                          ))),
                ],
              ),
            ),
          ],
        ));
  }
}
