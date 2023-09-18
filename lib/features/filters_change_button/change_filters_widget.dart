import 'package:flutter/material.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';

class ChoiceFilterType extends StatefulWidget {
  bool isCall;
  final VoidCallback onTapCallButton;
  final VoidCallback onTapBrigadeButton;
  ChoiceFilterType({super.key, required this.isCall, required this.onTapCallButton, required this.onTapBrigadeButton});

  @override
  State<ChoiceFilterType> createState() => _ChoiceFilterTypeState();
}

class _ChoiceFilterTypeState extends State<ChoiceFilterType> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
        border: Border.all(color: ThemeApp.primaryColor),
        borderRadius: BorderRadius.circular(8),
      ),
      height: 48,
      child: Row(
        children: [
          Expanded(
            child: MaterialButton(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8))
              ),
              height: 48,
              color: widget.isCall ? ThemeApp.primaryColor : ThemeApp.surfaceColorTwo,
              onPressed: () {
                widget.onTapCallButton();
              },
              child: Text('Вызов', style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: widget.isCall
                        ? ThemeApp.whiteColor
                        : ThemeApp.bodyColorTextAndIcons),),
            ),
          ),
          Expanded(
            child: MaterialButton(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8))
              ),
              height: 48,
              color: widget.isCall ? ThemeApp.surfaceColorTwo : ThemeApp.primaryColor,
              onPressed: () {
                widget.onTapBrigadeButton();

              },
              child: Text('Бригада', style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: widget.isCall
                      ? ThemeApp.bodyColorTextAndIcons
                      : ThemeApp.whiteColor),),
            ),
          )
        ],
      ),
    );
  }
}
