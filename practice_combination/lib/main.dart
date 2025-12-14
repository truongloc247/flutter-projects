import 'package:flutter/material.dart';
import 'package:practice_combination/practice_combination.dart';

void main() {
  runApp(MyPracticeCombination());
}

class MyPracticeCombination extends StatelessWidget {
  const MyPracticeCombination({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Combination());
  }
}
