//import "package:flutter/cupertino.dart" -- IOS
import "package:flutter/material.dart"; // -- GG
import "package:lecture_01/myhomepage.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}
