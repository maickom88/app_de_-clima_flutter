import 'package:app_de_clima/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeatherDetailsWidget extends StatelessWidget {
  final String description;

  const WeatherDetailsWidget({Key key, this.description}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (DescriptionWeather.cloudy.contains(description))
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SvgPicture.asset(SvgsConts.cloudy),
      );
    if (DescriptionWeather.clearSky.contains(description))
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SvgPicture.asset(SvgsConts.clearSky),
      );
    if (DescriptionWeather.raining.contains(description))
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SvgPicture.asset(SvgsConts.raining),
      );
    return Container();
  }
}
