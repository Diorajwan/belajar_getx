import 'package:belajar_getx/app/modules/formulir/views/formlir_output_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/formulir_controller.dart';

class FormulirView extends GetView<FormulirController> {
  const FormulirView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Formulir Pendaftaran',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 30),

            // Nama
            TextField(
              controller: controller.nameController,
              decoration: InputDecoration(
                labelText: 'Nama Lengkap',
                hintText: 'Masukkan nama Anda',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.person),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 20),

            // Pilihan Kursus
            Obx(
              () => DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Pilih Kursus',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.school),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                value: controller.selectedCourses.value.isEmpty
                    ? null
                    : controller.selectedCourses.value,
                items: controller.courses.map((course) {
                  return DropdownMenuItem(
                    value: course,
                    child: Text(course),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    controller.selectedCourses.value = value;
                  }
                },
              ),
            ),
            const SizedBox(height: 20),

            // Jenis Kelamin
            const Text(
              'Jenis Kelamin:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Obx(
              () => Column(
                children: [
                  RadioListTile<String>(
                    title: const Text('Laki-laki'),
                    value: 'Laki-laki',
                    groupValue: controller.gender.value,
                    onChanged: (value) {
                      controller.gender.value = value!;
                    },
                    activeColor: Colors.indigo,
                  ),
                  RadioListTile<String>(
                    title: const Text('Perempuan'),
                    value: 'Perempuan',
                    groupValue: controller.gender.value,
                    onChanged: (value) {
                      controller.gender.value = value!;
                    },
                    activeColor: Colors.indigo,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Tanggal
            GestureDetector(
              onTap: () => controller.selectDate(context),
              child: AbsorbPointer(
                child: Obx(
                  () => TextField(
                    readOnly: true,
                    controller: TextEditingController(
                      text: controller.formattedDate,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Tanggal Lahir',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: const Icon(Icons.calendar_today),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Tombol Submit
            ElevatedButton(
              onPressed: () {
                Get.to(() => FormulirOutputView());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
              ),
              child: const Text(
                'Submit',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
