import 'package:belajar_getx/app/modules/formulir/views/formlir_output_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:belajar_getx/app/modules/formulir/controllers/formulir_controller.dart';
// ignore: unused_import
import 'formulir_output_view.dart';

class FormulirView extends GetView<FormulirController> {
  const FormulirView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulir'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Input Nama
            TextField(
              controller: controller.nameController,
              decoration: const InputDecoration(
                labelText: 'Nama',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Dropdown Kursus
            Obx(
              () => DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Pilih Kursus',
                  border: OutlineInputBorder(),
                ),
                value: controller.selectedCourse.value.isEmpty
                    ? null
                    : controller.selectedCourse.value,
                items: controller.courses.map((course) {
                  return DropdownMenuItem(
                    value: course,
                    child: Text(course),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    controller.selectedCourse.value = value;
                  }
                },
              ),
            ),
            const SizedBox(height: 20),

            // RadioButton Gender
            Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Jenis Kelamin:"),
                  Row(
                    children: [
                      Radio<String>(
                        value: "Laki-laki",
                        groupValue: controller.gender.value,
                        onChanged: (value) {
                          if (value != null) {
                            controller.gender.value = value;
                          }
                        },
                      ),
                      const Text("Laki-laki"),
                      Radio<String>(
                        value: "Perempuan",
                        groupValue: controller.gender.value,
                        onChanged: (value) {
                          if (value != null) {
                            controller.gender.value = value;
                          }
                        },
                      ),
                      const Text("Perempuan"),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),

            // DatePicker (gunakan Text Obx biar gak bikin controller baru tiap build)
            Obx(
              () => TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Tanggal Lahir",
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () => controller.pickDate(),
                  ),
                ),
                controller: TextEditingController(
                  text: controller.formattedDate,
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Tombol Submit
            ElevatedButton(
              onPressed: () {
                // Arahkan ke output view, passing data langsung
                Get.to(
                  () => FormulirOutputView(
                    nama: controller.nameController.text,
                    kursus: controller.selectedCourse.value,
                    gender: controller.gender.value,
                    tanggal: controller.formattedDate,
                  ),
                );
              },
              child: const Text("Submit"),
            )
          ],
        ),
      ),
    );
  }
}
