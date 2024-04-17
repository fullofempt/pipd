import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pipd/app/routes/app_pages.dart';
import 'package:pipd/app/services/services.dart';

void main() {
  runApp(GetMaterialApp(
    // initServices();
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.SPLASH,
    defaultTransition: Transition.circularReveal,
    getPages: AppPages.routes,
  ));

//   Future<void> initServices() async {
//   await Get.putAsync(() async => DataService().init());
// }
}
