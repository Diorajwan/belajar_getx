import 'package:get/get.dart';
import 'penjualan_controller.dart';

class PenjualanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PenjualanController>(() => PenjualanController());
  }
}
