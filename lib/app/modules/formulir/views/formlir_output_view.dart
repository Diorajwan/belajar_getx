import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormulirOutputView extends StatelessWidget {
  final String nama;
  final String kursus;
  final String gender;
  final String tanggal;

  const FormulirOutputView({
    super.key,
    required this.nama,
    required this.kursus,
    required this.gender,
    required this.tanggal,
  });

  get controller => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Output Formulir"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Data Tersimpan",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text("Nama: $nama", style: const TextStyle(fontSize: 16)),
            Text("Kursus: $kursus", style: const TextStyle(fontSize: 16)),
            Text("Gender: $gender", style: const TextStyle(fontSize: 16)),
            Text("Tanggal Lahir: $tanggal",
                style: const TextStyle(fontSize: 16)),

            // Tombol kembali
            ElevatedButton(
              onPressed: () {
                controller.clearForm(); // reset data kalau mau
                Get.back(); // kembali ke FormulirView
              },
              child: Text("Kembali ke Formulir"),
            ),
          ],
        ),
      ),
    );
  }
}
