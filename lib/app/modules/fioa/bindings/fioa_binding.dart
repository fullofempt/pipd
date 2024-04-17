import 'package:get/get.dart';

import '../controllers/fioa_controller.dart';

class FioaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FioaController>(
      () => FioaController(),
    );
  }
}
