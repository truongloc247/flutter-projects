import 'dart:math';

import 'package:flutter/material.dart';

class Change extends StatefulWidget {
  const Change({super.key});

  @override
  State<Change> createState() => _ChangeState();
}

class _ChangeState extends State<Change> {
  List<Color> myColors = [
    Colors.blue,
    Colors.red,
    Colors.purple,
    Colors.yellow,
    Colors.pink,
    Colors.green,
    Colors.grey,
    Colors.orange,
  ];
  List<String> myColorTexts = [
    "Xanh dương",
    "Đỏ",
    "Tím",
    "Vàng",
    "Hồng",
    "Xanh lá",
    "Xám",
    "Cam",
  ];

  Random rd = Random();
  int rdNum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            "Change Color App",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: randomColor(),
    );
  }

  Widget randomColor() {
    return Container(
      decoration: BoxDecoration(color: myColors[rdNum]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          Text(
            "Màu hiện tại là màu:",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            myColorTexts[rdNum],
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: myColors[rdNum],
                ),
                onPressed: () {
                  setState(() {
                    rdNum = rd.nextInt(myColors.length);
                  });
                },
                label: Text(
                  "Đổi màu",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                icon: Icon(Icons.color_lens),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: myColors[rdNum],
                ),
                onPressed: () {
                  setState(() {
                    rdNum = 0;
                  });
                },
                label: Text(
                  "Đặt lại màu",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                icon: Icon(Icons.replay_circle_filled_rounded),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
