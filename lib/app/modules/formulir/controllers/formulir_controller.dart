import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FormulirController extends GetxController {
  final nameController = TextEditingController();

  final selectedCourses = ''.obs;

  List<String> courses = ['Flutter', 'Dart', 'Java', 'Python', 'JavaScript'];

  final gender = ''.obs;

  // Menggunakan Rx<DateTime> untuk tanggal yang dipilih
  final selectedDate = DateTime.now().obs;

  // Getter untuk mendapatkan format tanggal yang sudah diubah
  String get formattedDate =>
      DateFormat('dd/MM/yyyy').format(selectedDate.value);

  // Fungsi untuk menampilkan date picker dan memperbarui tanggal
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      // Mengatur rentang tahun yang lebih masuk akal untuk tanggal lahir
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime.now(), // Membatasi hingga tanggal hari ini
    );

    // Memastikan tanggal dipilih sebelum memperbarui nilai
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
    }
  }

  void clearForm() {
    nameController.clear();
    selectedCourses.value = '';
    gender.value = '';
    selectedDate.value = DateTime.now();
  }

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }
}
