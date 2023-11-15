import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextWithIcon extends StatelessWidget {
  final String iconPath;
  final String text;
  final Color textColor;
  const TextWithIcon({super.key, required this.iconPath, required this.text, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12, left: 12),
      child: Row(
        children: [
          SvgPicture.asset(iconPath, height: 16, width: 16,),
          const SizedBox(
            width: 6,
          ),
          Text(
           text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style:  TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: textColor),
          ),
        ],
      ),
    );
  }
}
