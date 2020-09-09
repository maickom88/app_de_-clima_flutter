import 'package:app_de_clima/core/errors/failures.dart';
import 'package:app_de_clima/features/get_default_weather/domain/entities/city.dart';
import 'package:app_de_clima/features/get_default_weather/domain/repositories/weather_default_repository.dart';
import 'package:app_de_clima/features/get_default_weather/domain/usecases/get_deafult_weather.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockWeatherDefaultRepository extends Mock
    implements WeatherDefaultRepository {}

void main() {
  WeatherDefaultRepository repository;
  GetDefaultWeather usecase;

  setUp(() {
    repository = MockWeatherDefaultRepository();
    usecase = GetDefaultWeather(repository: repository);
  });
  final tCity = City(
    administrativeArea: 'Pernambuco',
    country: 'Brasil',
    postalCode: '56000-000',
    subAdministrativeArea: 'Salgueiro',
  );
  test('Should return an instance of City if it works', () async {
    when(repository.getWeatherDefault()).thenAnswer((_) async => Right(tCity));
    final result = await usecase();
    expect(result | null, isA<City>());
  });

  test('Should return an instance of Failure if it fails', () async {
    when(repository.getWeatherDefault())
        .thenAnswer((_) async => Left(AccessDenied()));
    final result = await usecase();
    expect(result.fold(id, id), isA<Failure>());
  });
}
