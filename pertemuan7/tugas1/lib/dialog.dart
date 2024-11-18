import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("dialog example")),
        body: DialogExample(),
      ),
    );
  }
}

class DialogExample extends StatelessWidget {
  const DialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Hello"),
                  content: Text("this is normal dialog"),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("close"),
                    ),
                  ],
                ),
              );
            },
            child: Text("Show normal dialog"),
          ),
          ElevatedButton(
            onPressed: () {
              Get.defaultDialog(
                title: "Hello",
                middleText: "this is a getx dialog",
              );
            },
            child: Text("show getx dialog"),
          ),
        ],
      ),
    );
  }
}
