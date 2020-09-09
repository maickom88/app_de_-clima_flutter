import 'package:app_de_clima/core/errors/failures.dart';
import 'package:app_de_clima/features/get_default_weather/domain/entities/city.dart';
import 'package:app_de_clima/features/get_default_weather/infrastructure/data/city_datasource.dart';
import 'package:app_de_clima/features/get_default_weather/infrastructure/models/city_model.dart';
import 'package:app_de_clima/features/get_default_weather/infrastructure/reporitories/weather_default_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockCityDataSource extends Mock implements CityDataSource {}

void main() {
  CityDataSource datasource;
  WeatherDefaultRepositoryImpl repositoryImpl;

  setUp(() {
    datasource = MockCityDataSource();
    repositoryImpl = WeatherDefaultRepositoryImpl(cityDataSource: datasource);
  });
  final tCity = CityModel(
    administrativeArea: 'Pernambuco',
    country: 'Brasil',
    postalCode: '56000-000',
    subAdministrativeArea: 'Salgueiro',
  );

  test('Should return an instance of CityModel if it works', () async {
    when(datasource.getLocation()).thenAnswer((_) async => tCity);
    final result = await repositoryImpl.getWeatherDefault();
    expect(result | null, isA<City>());
  });

  test('Should return an instance of AccessDenied if it fails', () async {
    when(datasource.getLocation()).thenThrow(Exception());
    final result = await repositoryImpl.getWeatherDefault();
    expect(result.fold(id, id), isA<AccessDenied>());
  });
}
