import 'package:flutter/material.dart';
import 'package:project_smm/app.dart';
import 'package:project_smm/entities/local_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  runApp(const MyApp());
}

