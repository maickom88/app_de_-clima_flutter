import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../entities/weather.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/weather_repository.dart';

class GetWeatherCity {
  final WeatherRepository repository;

  GetWeatherCity({
    @required this.repository,
  });

  Future<Either<Failure, Weather>> call(String searchCity) async {
    if (searchCity == null || searchCity.isEmpty) {
      return Left(InvalidText());
    }
    return await repository.getWeather(searchCity);
  }
}
