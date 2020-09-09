import 'package:app_de_clima/core/errors/failures.dart';
import 'package:app_de_clima/features/get_default_weather/infrastructure/data/city_datasource.dart';
import 'package:app_de_clima/features/get_default_weather/infrastructure/models/city_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class CityDataSourceImpl implements CityDataSource {
  Position position;
  LocationPermission permission;
  List<Placemark> placemarks;

  @override
  Future<CityModel> getLocation() async {
    position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    permission = await checkPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      throw AccessDenied();
    }
    placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    if (placemarks.isEmpty) throw DataSourceError();
    var map = placemarks[0].toJson();
    var cityInfo = CityModel.fromMap(map);
    return cityInfo;
  }
}
