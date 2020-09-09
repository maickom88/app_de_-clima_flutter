import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../features/get_weather/domain/usecases/get_weather_city.dart';
import '../../../features/get_weather/external/datasources/weather_datasource_impl.dart';
import '../../../features/get_weather/infrastructure/repositories/weather_repository_impl.dart';
import '../../../features/get_weather/presentation/controller/home_controller.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        screenArgs: Get.arguments,
        usecase: GetWeatherCity(
          repository: WeatherRepositoryImpl(
            datasource: WeatherDataSourceIpml(
              dio: Dio(),
            ),
          ),
        ),
      ),
    );
  }
}
