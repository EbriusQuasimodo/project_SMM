import 'package:flutter/material.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';

class CustomDialogWithTwoButtons extends StatelessWidget {
  final String title;
  final VoidCallback onTapFirstButton;
  final VoidCallback onTapSecondButton;
  const CustomDialogWithTwoButtons({super.key, required this.title, required this.onTapFirstButton, required this.onTapSecondButton});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetPadding: const EdgeInsets.only(left: 36, right: 36),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          margin: const EdgeInsets.only(
              left: 36, right: 36, top: 36, bottom: 36),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 22, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        onTapFirstButton();
                      },
                      minWidth: double.infinity,
                      elevation: 0,
                      color: ThemeApp.secondaryColor,
                      height: 40,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Text(
                       'Нет',
                        style: TextStyle(
                            fontSize: 14,
                            color: ThemeApp.primaryColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        onTapSecondButton();
                        //Navigator.of(context).pop();
                      },
                      minWidth: double.infinity,
                      color: ThemeApp.primaryColor,
                      height: 40,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Text(
                        'Да',
                        style: TextStyle(
                            fontSize: 14,
                            color: ThemeApp.whiteColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
