import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../data/weather_datasource.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/weather.dart';
import '../../domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherDataSource datasource;

  WeatherRepositoryImpl({
    @required this.datasource,
  });

  @override
  Future<Either<Failure, Weather>> getWeather(String searchCity) async {
    try {
      final result = await datasource.getWeather(searchCity);
      return Right(result);
    } on DataSourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
