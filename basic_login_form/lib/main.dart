import 'package:basic_login_form/my_login_form.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(LoginForm());
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyLoginForm());
  }
}
