import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:tugas_3/pages/home.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("AVATAR GLOW"),
        ),
        body: Center(
          child: AvatarGlow(
              glowColor: Colors.red,
              duration: Duration(milliseconds: 500),
              child: Material(
                elevation: 8.0,
                shape: CircleBorder(),
                child: CircleAvatar(
                  backgroundColor: Colors.grey[100],
                  backgroundImage: NetworkImage("https://picsum.photos/200"),
                  radius: 75.0,
                ),
              )),
        ));
  }
}
