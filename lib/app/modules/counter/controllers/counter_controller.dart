import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  // nilai counter
  final count = 0.obs;

  // fungsi tambah
  void increment() {
    if (count.value < 100) {
      count.value++;
    } else {
      Get.snackbar(
        "Stop",
        "Nilai sudah mencapai 100",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  // fungsi kurang
  void decrement() {
    if (count.value > 0) {
      count.value--; // ✅ sekarang bisa turun sampai 0
    } else {
      Get.snackbar(
        "Stop",
        "Nilai sudah mencapai 0",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
