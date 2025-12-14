import 'package:authentication_authorization_app/login.dart';
import 'package:basic_login_form/my_login_form.dart';
import 'package:basic_register_form/register_form.dart';
import 'package:change_color/change.dart';
import 'package:countdown_timer/my_countdown_engine.dart';
import 'package:flutter/material.dart';
import 'package:lecture_02/myHomePage.dart' as l2;
import 'package:lecture_03/myhomepage.dart' as l3;
import 'package:news_app/news_list_page.dart';
import 'package:number_counter/counter.dart';
import 'package:practice_01/myhome.dart' as p1;
import 'package:practice_02/myhome.dart' as p2;
import 'package:product_list/product_list.dart';

class Combination extends StatefulWidget {
  const Combination({super.key});

  @override
  State<Combination> createState() => _CombinationState();
}

class _CombinationState extends State<Combination> {
  // int _selectedIndex = 0;

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF35A2B6),
        title: Text(
          "TỔNG HỢP BÀI TẬP",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu, color: Colors.white),
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "🪪 22T1020205",
              style: TextStyle(
                color: Color(0xFF35A2B6),
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Text(
              "🧑‍🎓 Trương Văn Tấn Lộc",
              style: TextStyle(
                color: Color(0xFF35A2B6),
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF35A2B6)),
              child: Center(
                child: Text(
                  '📋 DANH SÁCH BÀI TẬP',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text("BÀI 1: Giới thiệu địa điểm du lịch"),
              onTap: () {
                // _onItemTapped(0);

                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) => const l2.MyHomePage(),
                  ),
                );
              },
              // selected: _selectedIndex == 0,
              // selectedColor: Color(0xFF35A2B6),
            ),
            ListTile(
              title: const Text("BÀI 2: Danh sách lớp học"),
              onTap: () {
                // _onItemTapped(1);

                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) => const l3.Myhomepage(),
                  ),
                );
              },
              // selected: _selectedIndex == 1,
              // selectedColor: Color(0xFF35A2B6),
            ),
            ListTile(
              title: const Text("BÀI 3: Danh sách địa điểm đơn giản"),
              onTap: () {
                // _onItemTapped(2);

                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) => const p1.MyHome(),
                  ),
                );
              },
              // selected: _selectedIndex == 2,
              // selectedColor: Color(0xFF35A2B6),
            ),
            ListTile(
              title: const Text("BÀI 4: Danh sách địa điểm phức tạp"),
              onTap: () {
                // _onItemTapped(3);

                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) => const p2.MyHome(),
                  ),
                );
              },
              // selected: _selectedIndex == 3,
              // selectedColor: Color(0xFF35A2B6),
            ),
            ListTile(
              title: const Text("BÀI 5: Change color app"),
              onTap: () {
                // _onItemTapped(4);

                Navigator.of(context).push(
                  MaterialPageRoute<void>(builder: (context) => const Change()),
                );
              },
              // selected: _selectedIndex == 4,
              // selectedColor: Color(0xFF35A2B6),
            ),
            ListTile(
              title: const Text("BÀI 6: Ứng dụng đếm số"),
              onTap: () {
                // _onItemTapped(5);

                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) => const Counter(),
                  ),
                );
              },
              // selected: _selectedIndex == 5,
              // selectedColor: Color(0xFF35A2B6),
            ),
            ListTile(
              title: const Text("BÀI 7: Bộ đếm thời gian"),
              onTap: () {
                // _onItemTapped(6);

                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) => const MyCountdownEngine(),
                  ),
                );
              },
              // selected: _selectedIndex == 6,
              // selectedColor: Color(0xFF35A2B6),
            ),
            ListTile(
              title: const Text("BÀI 8: Login form"),
              onTap: () {
                // _onItemTapped(7);

                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) => const MyLoginForm(),
                  ),
                );
              },
              // selected: _selectedIndex == 7,
              // selectedColor: Color(0xFF35A2B6),
            ),
            ListTile(
              title: const Text("BÀI 9: Register form"),
              onTap: () {
                // _onItemTapped(8);

                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) => const RegisterForm(),
                  ),
                );
              },
              // selected: _selectedIndex == 8,
              // selectedColor: Color(0xFF35A2B6),
            ),
            ListTile(
              title: const Text("BÀI 10: Danh sách sản phẩm (WebAPI)"),
              onTap: () {
                // _onItemTapped(9);

                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) => const ProductList(),
                  ),
                );
              },
              // selected: _selectedIndex == 9,
              // selectedColor: Color(0xFF35A2B6),
            ),
            ListTile(
              title: const Text("BÀI 11: News app"),
              onTap: () {
                // _onItemTapped(10);

                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) => const NewsListPage(),
                  ),
                );
              },
              // selected: _selectedIndex == 10,
              // selectedColor: Color(0xFF35A2B6),
            ),
            ListTile(
              title: const Text("BÀI 12: Login and Profile"),
              onTap: () {
                // _onItemTapped(11);

                Navigator.of(context).push(
                  MaterialPageRoute<void>(builder: (context) => const Login()),
                );
              },
              // selected: _selectedIndex == 11,
              // selectedColor: Color(0xFF35A2B6),
            ),
          ],
        ),
      ),
    );
  }
}
