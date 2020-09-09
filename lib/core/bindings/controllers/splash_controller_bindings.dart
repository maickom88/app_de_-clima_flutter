import 'package:app_de_clima/features/get_default_weather/domain/usecases/get_deafult_weather.dart';
import 'package:app_de_clima/features/get_default_weather/external/datasources/city_datasource_impl.dart';
import 'package:app_de_clima/features/get_default_weather/infrastructure/reporitories/weather_default_repository_impl.dart';
import 'package:app_de_clima/features/get_default_weather/presentation/controller/splash_controller.dart';
import 'package:get/get.dart';

class SplashControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      SplashController(
        usecase: GetDefaultWeather(
          repository: WeatherDefaultRepositoryImpl(
            cityDataSource: CityDataSourceImpl(),
          ),
        ),
      ),
    );
  }
}
