import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/city.dart';
import '../../domain/repositories/weather_default_repository.dart';
import '../data/city_datasource.dart';

class WeatherDefaultRepositoryImpl implements WeatherDefaultRepository {
  final CityDataSource cityDataSource;

  WeatherDefaultRepositoryImpl({
    @required this.cityDataSource,
  });

  @override
  Future<Either<Failure, City>> getWeatherDefault() async {
    try {
      final result = await cityDataSource.getLocation();
      return Right(result);
    } on AccessDenied catch (e) {
      return Left(e);
    } catch (e) {
      return Left(AccessDenied());
    }
  }
}
