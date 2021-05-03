import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/services/locator.dart';
import 'package:provider/provider.dart';

import 'features/dashboard/dashboard_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: setupProvider,
      child: GetMaterialApp(
        title: 'MyApp',
        debugShowCheckedModeBanner: false,
        home: DashboardScreen(),
      ),
    );
  }
}
