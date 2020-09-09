import 'dart:convert';

import 'package:meta/meta.dart';

import 'package:app_de_clima/features/get_default_weather/domain/entities/city.dart';

class CityModel extends City {
  final String country;
  final String postalCode;
  final String administrativeArea;
  final String subAdministrativeArea;

  CityModel({
    @required this.country,
    @required this.postalCode,
    @required this.administrativeArea,
    @required this.subAdministrativeArea,
  });

  Map<String, dynamic> toMap() {
    return {
      'country': country,
      'postalCode': postalCode,
      'administrativeArea': administrativeArea,
      'subAdministrativeArea': subAdministrativeArea,
    };
  }

  factory CityModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CityModel(
      country: map['country'],
      postalCode: map['postalCode'],
      administrativeArea: map['administrativeArea'],
      subAdministrativeArea: map['subAdministrativeArea'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CityModel.fromJson(String source) =>
      CityModel.fromMap(json.decode(source));
}
