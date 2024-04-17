import 'package:get/get.dart';
import 'package:pipd/app/modules/historyJson/views/history_json_view.dart';

import '../modules/fioa/bindings/fioa_binding.dart';
import '../modules/fioa/views/fioa_view.dart';
import '../modules/historyJson/bindings/history_json_binding.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.MAIN,
      page: () => const MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.FIOA,
      page: () => const FIOA(),
      binding: FioaBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY_JSON,
      page: () => const HistoryJson(),
      binding: HistoryJsonBinding(),
    ),
  ];
}
