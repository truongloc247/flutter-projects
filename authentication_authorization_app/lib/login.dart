import 'package:authentication_authorization_app/home.dart';
import 'package:authentication_authorization_app/model/api.dart';
import 'package:authentication_authorization_app/model/login_info.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _loginKey = GlobalKey<FormState>();
  String? username;
  String? password;

  bool _hiddenPassword = true;

  late API api;

  @override
  void initState() {
    api = API();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "LOGIN",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xFF35A2B6),
      ),
      body: loginForm(),
    );
  }

  Widget loginForm() {
    return Form(
      key: _loginKey,
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          spacing: 30,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              // initialValue: username,
              onChanged: (value) {
                username = value;
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person, color: Color(0xFF35A2B6)),
                label: Text(
                  "Username",
                  style: TextStyle(color: Color(0xFF35A2B6)),
                ),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF35A2B6), width: 2),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter username";
                }
                return null;
              },
            ),
            TextFormField(
              // initialValue: password,
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              obscureText: _hiddenPassword,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock, color: Color(0xFF35A2B6)),
                label: Text(
                  "Password",
                  style: TextStyle(color: Color(0xFF35A2B6)),
                ),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF35A2B6),
                    width: 2,
                  ), // viền khi focus
                ),
                suffixIcon: password == null || password == ""
                    ? null
                    : _hiddenPassword
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            _hiddenPassword = !_hiddenPassword;
                          });
                        },
                        icon: Icon(Icons.visibility, color: Color(0xFF35A2B6)),
                      )
                    : IconButton(
                        onPressed: () {
                          setState(() {
                            _hiddenPassword = !_hiddenPassword;
                          });
                        },
                        icon: Icon(
                          Icons.visibility_off,
                          color: Color(0xFF35A2B6),
                        ),
                      ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter password";
                }
                return null;
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                iconColor: Colors.white,
                foregroundColor: Colors.white,
                backgroundColor: Color(0xFF35A2B6),
              ),
              onPressed: () async {
                if (_loginKey.currentState!.validate()) {
                  LoginInfo? loginInfo = await api.login(
                    username!,
                    password!,
                    1,
                    context,
                  );
                  if (loginInfo != null) {
                    setState(() {
                      username = null;
                      password = null;
                      _hiddenPassword = true;
                      _loginKey = GlobalKey<FormState>();
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(loginInfo: loginInfo),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Username or password are not correct!'),
                      ),
                    );
                  }
                }
              },
              child: Row(
                spacing: 5,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.login, fontWeight: FontWeight.bold),
                  Text("Login", style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
