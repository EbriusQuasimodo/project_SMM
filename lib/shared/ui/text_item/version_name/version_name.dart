import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:project_smm/shared/lib/theme/theme_app.dart';

class VersionName extends StatefulWidget {
  const VersionName({super.key});

  @override
  State<VersionName> createState() => _VersionNameState();
}

class _VersionNameState extends State<VersionName> {
  late PackageInfo packageInfo;
  late String versionName;

  @override
  void initState (){
    super.initState();

    Future.microtask(() async {
    packageInfo = await PackageInfo.fromPlatform();});
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 12.0),
      child: Text('Версия 1.0.0', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: ThemeApp.tertiaryColorTextAndIcons),),
    );
  }
}
