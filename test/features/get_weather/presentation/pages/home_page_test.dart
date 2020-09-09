import 'package:app_de_clima/core/constants/routes_pages_nameds.dart';
import 'package:app_de_clima/core/routes/routes_navigations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('You must load the scaffolding', (tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App de Clima',
        initialRoute: RoutesPages.homePage,
        getPages: Nav.routesPages,
      ),
    );
    expect(find.byType(Scaffold), findsOneWidget);
  });
}
