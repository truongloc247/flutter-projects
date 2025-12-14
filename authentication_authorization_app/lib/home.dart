import 'package:authentication_authorization_app/model/api.dart';
import 'package:authentication_authorization_app/model/login_info.dart';
import 'package:authentication_authorization_app/model/user.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  LoginInfo loginInfo;
  Home({super.key, required this.loginInfo});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late API api;
  late Future<User?> user;

  @override
  void initState() {
    api = API();
    user = api.getUserInfo(widget.loginInfo.accessToken);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF35A2B6),
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.login, fontWeight: FontWeight.bold),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  user = api.getUserInfo(widget.loginInfo.accessToken);
                });
              },
              icon: Icon(Icons.replay_outlined, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: userInfo(),
    );
  }

  Widget userInfo() {
    return FutureBuilder(
      future: user,
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.done) {
          if (snap.hasError) {
            return Center(child: Text('Error: ${snap.error}'));
          }
          if (snap.data != null) {
            return info(snap.data!);
          }
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pop(context);
          });
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget info(User user) {
    return ListView(
      children: [
        SizedBox(
          height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: Image.network(user.image),
              ),
              Text(
                user.username,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Color(0xFF35A2B6),
                ),
              ),
              Text(user.email),
              Text(user.role),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 50),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("First name: ${user.firstName}"),
              Text("Last name: ${user.lastName}"),
              Text("Maiden name: ${user.maidenName}"),
              Text("Age: ${user.age}"),
              Text("Gender: ${user.gender}"),
              Text("Date of birth: ${user.birthDate}"),
              Text("Phone: ${user.phone}"),
              Text("Height: ${user.height}"),
              Text("Weight: ${user.weight}"),
              Text("Blood group: ${user.bloodGroup}"),
              Text("Eyes color: ${user.eyeColor}"),
            ],
          ),
        ),
      ],
    );
  }
}
