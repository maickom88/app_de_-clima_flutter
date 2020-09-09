import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../../../core/constants/routes_pages_nameds.dart';

import '../../domain/usecases/get_deafult_weather.dart';

class SplashController extends GetxController {
  final GetDefaultWeather usecase;

  SplashController({
    @required this.usecase,
  });

  @override
  void onInit() {
    Future.delayed(
      Duration(seconds: 3),
      () async {
        final result = await getLocation();
        Get.offAndToNamed(RoutesPages.homePage, arguments: result);
      },
    );
    super.onInit();
  }

  Future<dynamic> getLocation() async {
    var locationOrError;
    final result = await usecase();

    result.fold((l) {
      locationOrError = l;
    }, (r) {
      locationOrError = r;
    });

    return locationOrError;
  }
}
