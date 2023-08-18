import 'package:flutter/material.dart';
import 'package:project_smm/app/app.dart';
import 'package:project_smm/shared/lib/local_storage/local_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  runApp(const MyApp());
}

