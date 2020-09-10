import 'package:app_de_clima/core/components/widgets/weather_details.dart';
import 'package:app_de_clima/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/svgs_consts.dart';

class CardWeatherWidget extends StatelessWidget {
  final double temp;
  final String city;
  final String description;

  const CardWeatherWidget({
    Key key,
    @required this.temp,
    @required this.city,
    @required this.description,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Get.height * 0.5,
      decoration: BoxDecoration(
        color: Color(0xff323544),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              height: Get.height * 0.1,
              color: Color(0x520E0B18),
              child: Text(
                'Hoje',
                style: GoogleFonts.openSans(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              city,
              style: GoogleFonts.openSans(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              '${temp.round()}°C',
              style: GoogleFonts.openSans(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 70,
              ),
            ),
          ),
          WeatherDetailsWidget(
            description: description,
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              description.capitalize(description),
              style: GoogleFonts.openSans(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
