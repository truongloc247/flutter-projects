import 'package:flutter/material.dart';
import 'package:practice_01/myhome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SafeArea(child: MyHome()));
  }
}
