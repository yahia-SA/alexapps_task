import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:alexapps_task/app.dart';
import 'package:alexapps_task/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}
