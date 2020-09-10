import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../../../../core/components/errors/card_error_component.dart';
import '../../../../core/components/widgets/components.dart';
import '../../../../core/errors/failures.dart';
import '../../../get_default_weather/domain/entities/city.dart';
import '../controller/home_controller.dart';
import '../widgets/widgets.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
          child: SingleChildScrollView(
            child: SizedBox(
              height: Get.height,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  TopLogoWidget(),
                  SizedBox(height: 20),
                  SearchCityFormWidget(
                    textController: controller.textController,
                    onPress: () =>
                        controller.getWeather(controller.textController.text),
                  ),
                  SizedBox(height: 20),
                  GetBuilder<HomeController>(
                    dispose: (_) => controller.onClose(),
                    builder: (_) {
                      if (_.isLoad)
                        return Expanded(
                          child: Center(
                            child: CircularProgressIndicator(
                              backgroundColor:
                                  Theme.of(context).secondaryHeaderColor,
                            ),
                          ),
                        );
                      if (!_.weather.isNull)
                        return CardWeatherWidget(
                          city: controller.weather.nameCity,
                          description: controller.weather.description,
                          temp: controller.weather.temp,
                        );
                      if (_.failure is DataSourceError)
                        return CardErrorComponent();
                      if (_.failure is AccessDenied)
                        return CardErrorComponent(
                          messege: "ACESSO NEGADO",
                          description: "Você negou acesso a sua localiza",
                        );
                      return Expanded(
                        child: Center(
                          child: CircularProgressIndicator(
                            backgroundColor:
                                Theme.of(context).secondaryHeaderColor,
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  Obx(
                    () => Visibility(
                      visible: controller.showButton.value,
                      child: Center(
                        child: ButtonComponent(
                          nameButton: 'Voltar para sua cidade!',
                          onPress: () {
                            controller.getWeather(
                              controller.city.subAdministrativeArea,
                              isShowButton: false,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
