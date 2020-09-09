import 'package:app_de_clima/core/constants/colors_consts.dart';
import 'package:flutter/material.dart';

class AppThemeLight {
  static ThemeData getTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      secondaryHeaderColor: ColorsConst.secundaryColor,
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: ColorsConst.primaryColor,
      buttonColor: ColorsConst.secundaryColor,
      buttonTheme: ButtonThemeData(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        buttonColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }
}
