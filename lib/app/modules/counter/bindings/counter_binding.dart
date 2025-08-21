import 'package:get/get.dart';

import '../controllers/counter_controller.dart';

class CounterBinding extends Bindings {
  // ignore: annotate_overrides
  void dependencies() {
    Get.lazyPut<CounterController>(
      () => CounterController(),
    );
  }
}
