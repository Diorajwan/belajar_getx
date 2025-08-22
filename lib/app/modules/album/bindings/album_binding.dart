// lib/app/modules/formulir/bindings/formulir_binding.dart
import 'package:belajar_getx/app/modules/album/controllers/album_controller.dart';
import 'package:get/get.dart';

class AlbumBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AlbumController>(() => AlbumController());
  }
}
