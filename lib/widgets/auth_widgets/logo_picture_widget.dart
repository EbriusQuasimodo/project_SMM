import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoPictureWidget extends StatelessWidget {
  const LogoPictureWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 35),
        child: SvgPicture.asset('assets/images/icons/logo.svg'));
  }
}
