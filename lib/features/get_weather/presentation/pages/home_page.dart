import 'package:app_de_clima/core/components/errors/card_error_component.dart';
import 'package:app_de_clima/core/errors/failures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../widgets/widgets.dart';
import '../controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
        child: Column(
          children: [
            TopLogoWidget(),
            SizedBox(height: 20),
            SearchCityFormWidget(
              onPress: () {},
            ),
            SizedBox(height: 20),
            GetBuilder<HomeController>(
              builder: (_) {
                if (!_.weather.isNull)
                  return CardWeatherWidget(
                    city: controller.weather.nameCity,
                    description: controller.weather.description,
                    temp: controller.weather.temp,
                  );
                if (_.failure is DataSourceError) return CardErrorComponent();
                if (_.failure is AccessDenied)
                  return CardErrorComponent(
                    messege: "ACESSO NEGADO",
                    description: "Você negou acesso a sua localiza",
                  );
                return Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Theme.of(context).secondaryHeaderColor,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
