import 'package:app_de_clima/core/constants/routes_pages_nameds.dart';
import 'package:app_de_clima/core/routes/routes_navigations.dart';
import 'package:app_de_clima/features/get_weather/presentation/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('Checks whether the scaffold has been loaded', (tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App de Clima',
        initialRoute: RoutesPages.splashScreen,
        getPages: Nav.routesPages,
      ),
    );
    await tester.pump(Duration(seconds: 5));
    expect(find.byType(Scaffold), findsOneWidget);
  });
}
