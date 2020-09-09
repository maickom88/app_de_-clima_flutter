import 'package:app_de_clima/core/errors/failures.dart';
import 'package:get/state_manager.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/weather.dart';

import '../../domain/usecases/get_weather_city.dart';

class HomeController extends GetxController {
  final GetWeatherCity usecase;
  final Object screenArgs;
  HomeController({
    @required this.usecase,
    @required this.screenArgs,
  });
  Weather weather;
  Failure failure;

  @override
  Future<void> onInit() async {
    final result = await usecase.call('Salgueiro');
    result.fold(
      (l) {
        failure = l;
        print(l);
        update();
      },
      (r) {
        weather = r;
        print(r);
        update();
      },
    );

    super.onInit();
  }
}
