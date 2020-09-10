import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvalidTextComponent {
  static getMessegeInvalidText() {
    return Get.snackbar(
      'Error ao fazer busca',
      'Digite o nome da cidade',
      colorText: Colors.white,
    );
  }
}
