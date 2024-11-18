import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("bottom sheet example")),
        body: BottomSheetExample(),
      ),
    );
  }
}

class BottomSheetExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text("Show Normal Bottom Sheet"),
          ),
          ElevatedButton(
            onPressed: () {
              Get.bottomSheet(
                Container(
                  color: const Color.fromARGB(255, 215, 18, 18),
                  padding: EdgeInsets.all(16),
                  child: Text("this is a getx bottom sheet"),
                ),
              );
            },
            child: Text("Show getx bottom sheet"),
          ),
        ],
      ),
    );
  }
}
