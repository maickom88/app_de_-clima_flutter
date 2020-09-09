import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import '../../../../core/constants/constants.dart';
import '../controller/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Image.asset(ImagesConsts.logoBreand),
      ),
    );
  }
}
