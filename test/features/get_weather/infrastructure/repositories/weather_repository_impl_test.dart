import 'package:app_de_clima/features/get_weather/domain/entities/weather.dart';
import 'package:app_de_clima/features/get_weather/infrastructure/data/weather_datasource.dart';
import 'package:app_de_clima/features/get_weather/infrastructure/models/weather_model.dart';
import 'package:app_de_clima/features/get_weather/infrastructure/repositories/weather_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockWeatherDatasouce extends Mock implements WeatherDataSource {}

void main() {
  MockWeatherDatasouce datasource;
  WeatherRepositoryImpl repositoryImpl;

  setUp(() {
    datasource = MockWeatherDatasouce();
    repositoryImpl = WeatherRepositoryImpl(datasource: datasource);
  });

  final tWeatherModel =
      WeatherModel(nameCity: 'Salgueiro', temp: 32, description: 'Céu limpo');
  test('Should return an instance of WeatherModel if it works', () async {
    when(datasource.getWeather(any)).thenAnswer((_) async => tWeatherModel);
    final result = await repositoryImpl.getWeather('Salgueiro');
    expect(result | null, isA<Weather>());
  });

  test('Should return an instance of DatasourceError if it fails', () async {
    when(datasource.getWeather(any)).thenThrow(Exception());
    final result = await repositoryImpl.getWeather('Salgueiro');
    expect(result.isLeft(), true);
  });
}
