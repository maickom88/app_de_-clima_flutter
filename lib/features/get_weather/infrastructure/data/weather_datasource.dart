import '../models/weather_model.dart';

abstract class WeatherDataSource {
  Future<WeatherModel> getWeather(String searchCity);
}
