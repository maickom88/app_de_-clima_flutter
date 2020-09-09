import '../models/city_model.dart';

abstract class CityDataSource {
  Future<CityModel> getLocation();
}
