import 'package:app_de_clima/core/errors/failures.dart';
import 'package:app_de_clima/features/get_default_weather/domain/entities/city.dart';
import 'package:dartz/dartz.dart';

abstract class WeatherDefaultRepository {
  Future<Either<Failure, City>> getWeatherDefault();
}
