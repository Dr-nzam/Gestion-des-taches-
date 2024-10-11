import 'package:get/get.dart';
import 'package:inetache/ecrans/splash.dart';
import 'package:inetache/routes/app_route.dart';

class AppPage {
  static List<GetPage> page = [
    GetPage(
        name: AppRoute.splash, page: () => const Splash()),
  ];
}
