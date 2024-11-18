import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterPage(),
    );
  }
}

// Controller untuk state management
class CounterController extends GetxController {
  var counter = 0.obs;

  void increment() => counter++;
  void decrement() {
    if (counter > 0) counter--;
  }
}

// UI
class CounterPage extends StatelessWidget {
  CounterPage({super.key});

  final CounterController counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX State Management'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
              style: TextStyle(fontSize: 16),
            ),
            Obx(() => Text(
                  '${counterController.counter}',
                  style: const TextStyle(
                      fontSize: 36, fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: counterController.decrement,
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: counterController.increment,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
