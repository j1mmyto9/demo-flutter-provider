import 'package:flutter/material.dart';
import 'package:my_app/services/locator.dart';
import 'package:my_app/services/user_defaults.dart';
import 'my_app.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await UserDefaults.instance.initAsync();
  runApp(MyApp());
}
