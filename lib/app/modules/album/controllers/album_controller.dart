// lib/app/modules/formulir/controllers/formulir_controller.dart
import 'package:belajar_getx/app/service/album_service_getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlbumController extends GetxController {
  // Controller untuk input
  final nameController = TextEditingController();
  var selectedCourses = "".obs;
  var gender = "".obs;
  var selectedDate = DateTime.now().obs;

  final courses = ["Flutter", "React", "Laravel"].obs;

  final AlbumService _service = AlbumService();

  String get formattedDate =>
      "${selectedDate.value.day}/${selectedDate.value.month}/${selectedDate.value.year}";

  Future<void> selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      selectedDate.value = picked;
    }
  }

  void submitForm() {
    final data = {
      "nama": nameController.text,
      "kursus": selectedCourses.value,
      "gender": gender.value,
      "tanggal": formattedDate,
    };

    _service.simpanPendaftaran(data);
    Get.snackbar("Sukses", "Data berhasil disimpan ✅");
  }

  List<Map<String, dynamic>> get allPendaftaran => _service.getAllPendaftaran();
}
