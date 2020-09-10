import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../../../core/components/validators/invalid_text.dart';
import '../../../../core/errors/failures.dart';
import '../../../get_default_weather/domain/entities/city.dart';
import '../../domain/entities/weather.dart';
import '../../domain/usecases/get_weather_city.dart';

class HomeController extends GetxController {
  final GetWeatherCity usecase;
  final Object screenArgs;

  HomeController({
    @required this.usecase,
    @required this.screenArgs,
  });

  Weather weather;
  Failure failure;
  City city;
  TextEditingController textController;
  bool isLoad = true;
  RxBool showButton = false.obs;

  @override
  Future<void> onInit() async {
    textController = TextEditingController();
    if (screenArgs is Failure) {
      failure = screenArgs;
      update();
    } else {
      city = screenArgs;
      final result = await usecase(city.subAdministrativeArea);
      result.fold(
        (l) {
          failure = l;
          isLoad = false;
          update();
        },
        (r) {
          weather = r;
          isLoad = false;
          update();
        },
      );
    }
  }

  void getWeather(String city, {bool isShowButton = true}) async {
    if (city.isEmpty) return InvalidTextComponent.getMessegeInvalidText();
    isLoad = true;
    update();
    final result = await usecase(city);
    result.fold(
      (l) {
        failure = l;
        weather = null;
        isLoad = false;
        update();
      },
      (r) {
        weather = r;
        failure = null;
        showButton.value = isShowButton;
        textController.clear();
        isLoad = false;
        update();
      },
    );
  }
}
