import 'package:get/get.dart';

import '../controllers/history_json_controller.dart';

class HistoryJsonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryJsonController>(
      () => HistoryJsonController(),
    );
  }
}
