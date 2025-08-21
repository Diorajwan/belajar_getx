import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/counter_controller.dart';

// ignore: must_be_immutable
class CounterView extends GetView<CounterController> {
  CounterView({Key? key}) : super(key: key);
  // ignore: annotate_overrides
  CounterController controller = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterView'),
        centerTitle: true,
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                controller.count.toString(),
                // ignore: prefer_const_constructors
                style: TextStyle(fontSize: 20),
              ),
            ),
            // ignore: prefer_const_constructors
            ElevatedButton(onPressed: ()=>controller.increment(), child: Text('tambah'))
          ],
        ),
      ),
    );
  }
}