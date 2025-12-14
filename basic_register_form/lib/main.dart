import 'package:basic_register_form/register_form.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyRegisterForm());
}

class MyRegisterForm extends StatelessWidget {
  const MyRegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: RegisterForm());
  }
}
