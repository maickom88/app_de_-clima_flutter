import 'package:meta/meta.dart';

class Weather {
  final String nameCity;
  final double temp;
  final String description;

  Weather({
    @required this.nameCity,
    @required this.temp,
    @required this.description,
  });
}
