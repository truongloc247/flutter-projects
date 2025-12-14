import 'dart:math';

import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Number counter",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.lightBlueAccent,
        centerTitle: true,
      ),
      body: counterBody(),
      backgroundColor: Colors.white,
    );
  }

  Widget counterBody() {
    List<Color> colors = [
      Colors.lightGreenAccent,
      Colors.red,
      Colors.purple,
      Colors.yellow,
      Colors.blue,
      Colors.pinkAccent,
    ];
    Random rd = Random();
    int colorIndex = rd.nextInt(colors.length);

    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Current number"),
          Text(
            "${number}",
            style: TextStyle(
              fontSize: 80,
              fontWeight: FontWeight.bold,
              color: colors[colorIndex],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    number--;
                    colorIndex = rd.nextInt(colors.length);
                  });
                },
                style: ElevatedButton.styleFrom(
                  iconColor: Colors.white,
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                ),
                child: Row(
                  spacing: 5,
                  children: [Icon(Icons.remove), Text("Minus")],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    number = 0;
                    colorIndex = rd.nextInt(colors.length);
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  iconColor: Colors.white,
                  foregroundColor: Colors.white,
                ),
                child: Row(
                  spacing: 5,
                  children: [Icon(Icons.refresh_outlined), Text("Reset")],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    colorIndex = rd.nextInt(colors.length);
                    number++;
                  });
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreenAccent,
                  iconColor: Colors.white,
                  foregroundColor: Colors.white,
                ),
                child: Row(
                  spacing: 5,
                  children: [Icon(Icons.add), Text("Plus")],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
