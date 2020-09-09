import 'package:app_de_clima/core/constants/images_const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopLogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          ImagesConsts.logoBreand,
          height: 60,
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'App Previsão do Tempo',
              style: GoogleFonts.openSans(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.8,
              ),
            ),
            Text(
              'veja as previsões do dia',
              style: GoogleFonts.openSans(
                color: Colors.white,
                fontSize: 14,
                letterSpacing: -0.8,
              ),
            ),
          ],
        )
      ],
    );
  }
}
