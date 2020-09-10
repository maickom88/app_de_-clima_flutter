import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../infrastructure/models/weather_model.dart';

import '../../../../core/constants/url_api.dart';
import '../../../../core/errors/failures.dart';
import '../../infrastructure/data/weather_datasource.dart';

class WeatherDataSourceIpml implements WeatherDataSource {
  final Dio dio;

  WeatherDataSourceIpml({
    @required this.dio,
  });

  @override
  Future<WeatherModel> getWeather(String searchCity) async {
    final response =
        await this.dio.get("${UrlApi.urlApi}/${searchCity.trim()}");
    if (response.statusCode == 200) {
      var data = json.decode(response.data);
      var weather = WeatherModel.fromMap(data);
      return weather;
    } else {
      throw DataSourceError();
    }
  }
}
