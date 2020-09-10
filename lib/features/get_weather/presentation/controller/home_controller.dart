import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

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

  void getWeather(String city) async {
    isLoad = true;
    update();
    if (city.isEmpty)
      return Get.snackbar(
        'Error ao fazer busca',
        'Digite o nome da cidade',
        colorText: Colors.white,
      );
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
        textController.clear();
        isLoad = false;
        update();
      },
    );
  }
}
