import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChoiceButton extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonName;
  final Color buttonColor;
  final String buttonIconPath;

  const ChoiceButton(
      {super.key,
      required this.onTap,
      required this.buttonName,
      required this.buttonColor,
      required this.buttonIconPath});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      height: 48,
      onPressed: () {
        onTap();
      },
      color: buttonColor,
      child: Row(
        children: [
          SvgPicture.asset(buttonIconPath),
          const SizedBox(width: 10,),
          Text(buttonName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
        ],
      ),
    );
  }
}
