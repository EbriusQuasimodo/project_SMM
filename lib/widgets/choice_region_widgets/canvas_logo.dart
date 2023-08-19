import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';

class CanvasLogoPictureWidget extends StatefulWidget {
  const CanvasLogoPictureWidget({super.key});

  @override
  State<CanvasLogoPictureWidget> createState() => _CanvasLogoPictureWidgetState();
}

class _CanvasLogoPictureWidgetState extends State<CanvasLogoPictureWidget> {

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: NewClipper(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: ThemeApp.primaryColor
        ),
        child: Column(children: [
          SvgPicture.asset('assets/images/icons/auth/logo_text_white.svg'),
          const SizedBox(height: 10,),
          SvgPicture.asset('assets/images/icons/auth/doctor.svg'),
          //const SizedBox(height:34,),
        ],),),
    );
  }
}

/*Container(
child: ClipPath(
clipper: NewClipper(),
child: SizedBox(
width: MediaQuery.of(context).size.width,
child: SvgPicture.asset(
'assets/images/icons/auth/logo.svg',
fit: BoxFit.fill,
height: 317,
width: 360,
),
),
),);*/

class NewClipper extends CustomClipper<Path> {
  final double heightFactor;

  NewClipper({this.heightFactor = 80.0});
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - heightFactor);
    path.quadraticBezierTo(
      size.width /2,
      size.height,
      size.width,
      size.height - heightFactor,
    );
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

