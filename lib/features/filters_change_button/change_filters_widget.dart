import 'package:flutter/material.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ChoiceFilterType extends StatefulWidget {
  bool isCall;
  final VoidCallback onTapCallButton;
  final VoidCallback onTapBrigadeButton;

  ChoiceFilterType(
      {super.key,
      required this.isCall,
      required this.onTapCallButton,
      required this.onTapBrigadeButton});

  @override
  State<ChoiceFilterType> createState() => _ChoiceFilterTypeState();
}

class _ChoiceFilterTypeState extends State<ChoiceFilterType> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16),
      height: 36,
      child: Row(
        children: [
          Expanded(
            child: MaterialButton(
              shape: const RoundedRectangleBorder(
                  side: BorderSide(color: ThemeApp.primaryColor),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8))),
              height: 48,
              color: widget.isCall
                  ? ThemeApp.primaryColor
                  : ThemeApp.surfaceColorTwo,
              onPressed: () {
                widget.onTapCallButton();
              },
              child: Text(
                AppLocalizations.of(context)!.call,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: widget.isCall
                        ? ThemeApp.whiteColor
                        : ThemeApp.bodyColorTextAndIcons),
              ),
            ),
          ),
          Expanded(
            child: MaterialButton(
              shape: const RoundedRectangleBorder(
                  side: BorderSide(color: ThemeApp.primaryColor),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8))),
              height: 48,
              color: widget.isCall
                  ? ThemeApp.surfaceColorTwo
                  : ThemeApp.primaryColor,
              onPressed: () {
                widget.onTapBrigadeButton();
              },
              child: Text(
                AppLocalizations.of(context)!.brigade,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: widget.isCall
                        ? ThemeApp.bodyColorTextAndIcons
                        : ThemeApp.whiteColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}
