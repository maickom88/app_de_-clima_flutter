import 'package:app_de_clima/core/constants/routes_pages_nameds.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/routes/routes_navigations.dart';
import 'core/theme/app_theme_light.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App de Clima',
      theme: AppThemeLight.getTheme(),
      initialRoute: RoutesPages.splashScreen,
      getPages: Nav.routesPages,
    );
  }
}
