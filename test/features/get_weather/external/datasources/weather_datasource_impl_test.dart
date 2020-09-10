import 'dart:convert';

import 'package:app_de_clima/core/errors/failures.dart';
import 'package:app_de_clima/features/get_weather/external/datasources/weather_datasource_impl.dart';
import 'package:app_de_clima/features/get_weather/infrastructure/models/weather_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockDio extends Mock implements Dio {}

void main() {
  MockDio dio;
  WeatherDataSourceIpml dataSourceIpml;
  setUp(() {
    dio = MockDio();
    dataSourceIpml = WeatherDataSourceIpml(dio: dio);
  });

  test('Should return an instance of WeatherModel if it works', () async {
    when(dio.get(any)).thenAnswer(
        (_) async => Response(data: fixtureString(), statusCode: 200));
    final result = await dataSourceIpml.getWeather('Salgueiro');
    expect(result, isA<WeatherModel>());
  });
  test('Should return an instance of DataSourceError if it fails', () async {
    when(dio.get(any))
        .thenAnswer((_) async => Response(data: null, statusCode: 401));

    final result = dataSourceIpml.getWeather('Salgueiro');
    expect(result, throwsA(isA<DataSourceError>()));
  });
}
