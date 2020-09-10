import 'package:app_de_clima/features/get_default_weather/domain/usecases/get_deafult_weather.dart';
import 'package:app_de_clima/features/get_default_weather/presentation/controller/splash_controller.dart';

class GetLocationDecoratee extends SplashController {
  final GetDefaultWeather usecase;

  GetLocationDecoratee({this.usecase});
}
