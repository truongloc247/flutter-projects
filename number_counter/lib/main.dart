import 'package:flutter/material.dart';
import 'package:number_counter/counter.dart';

void main() {
  runApp(NumberCounter());
}

class NumberCounter extends StatelessWidget {
  const NumberCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Counter());
  }
}
