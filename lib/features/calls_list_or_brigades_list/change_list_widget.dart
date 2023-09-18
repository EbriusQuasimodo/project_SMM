import 'package:flutter/material.dart' hide Badge;
import 'package:project_smm/shared/lib/theme/theme_app.dart';

import 'ui/button.dart';

class SwitchCallsOrBrigadeItem extends StatelessWidget {
  final int itemsLength;
  bool isCall;
  final VoidCallback onTapCallButton;
  final VoidCallback onTapBrigadeButton;

  SwitchCallsOrBrigadeItem({super.key, required this.itemsLength, required this.isCall, required this.onTapCallButton, required this.onTapBrigadeButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 12),
      height: 36,
      child: Row(
        children: [
          Button(
            buttonBorderColor: isCall ? ThemeApp.primaryColor : ThemeApp.elevationColorOne,
            onTap: (){
             onTapCallButton();
              },
            itemsLength: itemsLength,
            buttonName: 'Вызовы',
            buttonIcon: 'assets/images/icons/shared/phone.svg',
          ),
          Button(
            buttonBorderColor: isCall ? ThemeApp.elevationColorOne : ThemeApp.primaryColor,
            onTap: (){
              onTapBrigadeButton();
              },
            itemsLength: itemsLength,
            buttonName: 'Бригады',
            buttonIcon: 'assets/images/icons/shared/car.svg',
          ),
        ],
      ),
    );
  }
}
