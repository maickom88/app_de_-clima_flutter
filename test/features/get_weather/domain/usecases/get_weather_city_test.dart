import 'package:app_de_clima/core/errors/failures.dart';
import 'package:app_de_clima/features/get_weather/domain/entities/weather.dart';
import 'package:app_de_clima/features/get_weather/domain/repositories/weather_repository.dart';
import 'package:app_de_clima/features/get_weather/domain/usecases/get_weather_city.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  MockWeatherRepository repository;
  GetWeatherCity usecase;

  setUp(() {
    repository = MockWeatherRepository();
    usecase = GetWeatherCity(repository: repository);
  });

  final tWeather =
      Weather(nameCity: 'Salgueiro', temp: 32, description: 'Céu limpo');

  test('Should return an instance of Weather if it works', () async {
    when(repository.getWeather(any)).thenAnswer((_) async => Right(tWeather));
    final result = await usecase('salgueiro');
    expect(result | null, isA<Weather>());
  });

  test('Should return an instance of Invalidtext if field is empty', () async {
    when(repository.getWeather(any)).thenAnswer((_) async => Right(tWeather));
    var result = await usecase(null);
    expect(result.isLeft(), true);
    result = await usecase('');
    expect(result.fold(id, id), isA<InvalidText>());
  });
}
