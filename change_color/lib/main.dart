import 'package:change_color/change.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ColorChange());
}

class ColorChange extends StatelessWidget {
  const ColorChange({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Change());
  }
}
