import 'package:app_de_clima/core/errors/failures.dart';
import 'package:app_de_clima/features/get_default_weather/domain/entities/city.dart';
import 'package:app_de_clima/features/get_default_weather/domain/repositories/weather_default_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

class GetDefaultWeather {
  final WeatherDefaultRepository repository;

  GetDefaultWeather({
    @required this.repository,
  });

  Future<Either<Failure, City>> call() async {
    return await repository.getWeatherDefault();
  }
}
