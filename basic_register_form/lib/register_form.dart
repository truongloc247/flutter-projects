import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  bool _passwordIsHidden = false;
  bool _confirmPasswordIsHidden = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF35A2B6),
        title: Center(
          child: Text(
            "Form Đăng ký tài khoản",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: myForm(),
    );
  }

  Widget myForm() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          spacing: 20,
          children: [
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person, color: Color(0xFF35A2B6)),
                label: Text(
                  "Họ tên",
                  style: TextStyle(color: Color(0xFF35A2B6)),
                ),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF35A2B6), width: 2),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Vui lòng nhập họ tên";
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email, color: Color(0xFF35A2B6)),
                label: Text(
                  "Email",
                  style: TextStyle(color: Color(0xFF35A2B6)),
                ),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF35A2B6), width: 2),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Vui lòng nhập email";
                }
                return null;
              },
            ),
            TextFormField(
              obscureText: _passwordIsHidden,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock, color: Color(0xFF35A2B6)),
                label: Text(
                  "Mật khẩu",
                  style: TextStyle(color: Color(0xFF35A2B6)),
                ),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF35A2B6), width: 2),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _passwordIsHidden = !_passwordIsHidden;
                    });
                  },
                  icon: Icon(Icons.visibility, color: Color(0xFF35A2B6)),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Vui lòng nhập mật khẩu";
                }
                return null;
              },
            ),
            TextFormField(
              obscureText: _confirmPasswordIsHidden,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outline, color: Color(0xFF35A2B6)),
                label: Text(
                  "Xác nhận mật khẩu",
                  style: TextStyle(color: Color(0xFF35A2B6)),
                ),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF35A2B6), width: 2),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _confirmPasswordIsHidden = !_confirmPasswordIsHidden;
                    });
                  },
                  icon: Icon(Icons.visibility, color: Color(0xFF35A2B6)),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Vui lòng xác nhận mật khẩu";
                }
                return null;
              },
            ),
            ElevatedButton.icon(
              icon: Icon(Icons.person_add),
              label: Text(
                "Đăng ký",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color(0xFF35A2B6),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Đăng ký thành công!")),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
