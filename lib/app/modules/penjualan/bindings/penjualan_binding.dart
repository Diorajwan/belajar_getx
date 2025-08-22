import 'package:belajar_getx/app/modules/penjualan/controllers/penjualan_controller.dart';
import 'package:get/get.dart';
class PenjualanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PenjualanController>(() => PenjualanController());
  }
}
