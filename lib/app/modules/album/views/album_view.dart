// lib/app/modules/formulir/views/formulir_view.dart
import 'package:belajar_getx/app/modules/album/controllers/album_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AlbumView extends GetView<AlbumController> {
  const AlbumView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulir Pendaftaran"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Input Nama
            TextField(
              controller: controller.nameController,
              decoration: const InputDecoration(
                labelText: "Nama Lengkap",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Dropdown Kursus
            Obx(() => DropdownButtonFormField<String>(
                  value: controller.selectedCourses.value.isEmpty
                      ? null
                      : controller.selectedCourses.value,
                  items: controller.courses
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (val) =>
                      controller.selectedCourses.value = val ?? "",
                  decoration: const InputDecoration(
                    labelText: "Pilih Kursus",
                    border: OutlineInputBorder(),
                  ),
                )),
            const SizedBox(height: 16),

            // Radio Gender
            Obx(() => Column(
                  children: [
                    RadioListTile(
                      title: const Text("Laki-laki"),
                      value: "Laki-laki",
                      groupValue: controller.gender.value,
                      onChanged: (val) => controller.gender.value = val!,
                    ),
                    RadioListTile(
                      title: const Text("Perempuan"),
                      value: "Perempuan",
                      groupValue: controller.gender.value,
                      onChanged: (val) => controller.gender.value = val!,
                    ),
                  ],
                )),
            const SizedBox(height: 16),

            // Tanggal
            GestureDetector(
              onTap: () => controller.selectDate(context),
              child: AbsorbPointer(
                child: Obx(() => TextField(
                      readOnly: true,
                      controller:
                          TextEditingController(text: controller.formattedDate),
                      decoration: const InputDecoration(
                        labelText: "Tanggal Lahir",
                        border: OutlineInputBorder(),
                      ),
                    )),
              ),
            ),
            const SizedBox(height: 24),

            // Tombol Submit
            ElevatedButton(
              onPressed: () {
                controller.submitForm();
              },
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
