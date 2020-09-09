import 'package:get/route_manager.dart';

import '../bindings/controllers/bindings.dart';
import '../../features/get_default_weather/presentation/pages/splash_screen_page.dart';
import '../../features/get_weather/presentation/pages/home_page.dart';
import '../constants/routes_pages_nameds.dart';

class Nav {
  static List<GetPage> routesPages = [
    GetPage(
      name: RoutesPages.homePage,
      page: () => HomePage(),
      binding: HomeControllerBinding(),
    ),
    GetPage(
      name: RoutesPages.splashScreen,
      page: () => SplashScreen(),
      binding: SplashControllerBinding(),
    ),
  ];
}
