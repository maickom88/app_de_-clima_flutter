import 'package:meta/meta.dart';

class City {
  final String country;
  final String postalCode;
  final String administrativeArea;
  final String subAdministrativeArea;

  City({
    @required this.country,
    @required this.postalCode,
    @required this.administrativeArea,
    @required this.subAdministrativeArea,
  });
}
