import 'package:countdown_timer/my_countdown_engine.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyCountdownTimer());
}

class MyCountdownTimer extends StatelessWidget {
  const MyCountdownTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyCountdownEngine());
  }
}
