import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as myhttp;
import 'package:tugas_2/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameC = TextEditingController();
  TextEditingController jobC = TextEditingController();
  String hasilResponse = "belum ada data";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTTP PUT / PATCH"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: nameC,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Name",
            ),
          ),
          SizedBox(height: 15),
          TextField(
            controller: jobC,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Job",
            ),
          ),
          SizedBox(height: 15),
          ElevatedButton(
            onPressed: () async {
              var myresponse = await myhttp.post(
                Uri.parse("https://reqres.in/api/users/2"),
                body: {"name": nameC.text, "job": jobC.text},
              );

              Map<String, dynamic> data =
                  json.decode(myresponse.body) as Map<String, dynamic>;

              setState(() {
                hasilResponse = "${data['name']} - ${data['job']}";
              });
            },
            child: Text("SUBMIT"),
          ),
          SizedBox(height: 50),
          Divider(
            color: Colors.black,
          ),
          SizedBox(height: 10),
          Text(hasilResponse),
        ],
      ),
    );
  }
}
