import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../../../core/components/validators/invalid_text.dart';
import '../../../../core/decoratee/get_location_decoratee.dart';
import '../../../../core/errors/failures.dart';
import '../../../get_default_weather/domain/entities/city.dart';
import '../../../get_default_weather/domain/usecases/get_deafult_weather.dart';
import '../../../get_default_weather/external/datasources/city_datasource_impl.dart';
import '../../../get_default_weather/infrastructure/reporitories/weather_default_repository_impl.dart';
import '../../domain/entities/weather.dart';
import '../../domain/usecases/get_weather_city.dart';

class HomeController extends GetxController {
  final GetWeatherCity usecase;
  Object screenArgs;

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
    isLoad = true;
    update();
    textController = TextEditingController();
    if (screenArgs is Failure) {
      failure = screenArgs;
      isLoad = false;
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

  Future<void> getPermissionLocation() async {
    final localtionGetLocationDecoratee = GetLocationDecoratee(
      usecase: GetDefaultWeather(
        repository: WeatherDefaultRepositoryImpl(
          cityDataSource: CityDataSourceImpl(),
        ),
      ),
    );
    final result = await localtionGetLocationDecoratee.getLocation();
    screenArgs = result;
    onInit();
  }
}
