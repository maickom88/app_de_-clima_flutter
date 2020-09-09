import 'dart:convert';

import 'package:meta/meta.dart';

import '../../domain/entities/weather.dart';

class WeatherModel extends Weather {
  final String nameCity;
  final double temp;
  final String description;

  WeatherModel({
    @required this.nameCity,
    @required this.temp,
    @required this.description,
  });

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return WeatherModel(
      nameCity: map['name'],
      temp: map['main']['temp'],
      description: map['weather'][0]['description'],
    );
  }
}
