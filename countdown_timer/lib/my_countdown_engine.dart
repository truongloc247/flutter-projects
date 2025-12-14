import 'dart:async';

import 'package:flutter/material.dart';

class MyCountdownEngine extends StatefulWidget {
  const MyCountdownEngine({super.key});

  @override
  State<MyCountdownEngine> createState() => _MyCountdownEngineState();
}

class _MyCountdownEngineState extends State<MyCountdownEngine> {
  int _sec = 0;

  final TextEditingController _textController = TextEditingController();
  Timer? _timer;

  @override
  void dispose() {
    _textController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF35A2B6),
        title: Center(
          child: Text(
            "⏳ Bộ đếm thời gian",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: counter(),
    );
  }

  Widget counter() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Nhập số giây cần đếm:",
            style: TextStyle(
              color: Color(0xFF35A2B6),
              fontWeight: FontWeight.bold,
            ),
          ),
          TextField(
            controller: _textController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF35A2B6)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF35A2B6), width: 2),
              ),
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            "${(_sec ~/ 60).toString().padLeft(2, '0')} : ${(_sec % 60).toString().padLeft(2, '0')}",
            style: TextStyle(
              color: Color(0xFF35A2B6),
              fontWeight: FontWeight.bold,
              fontSize: 50,
            ),
          ),
          Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF35A2B6),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  String? inputSec = _textController.text;
                  if (inputSec != null && RegExp(r'^\d+$').hasMatch(inputSec)) {
                    setState(() {
                      _sec = int.tryParse(inputSec)!;
                      _timer?.cancel();
                      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
                        if (_sec <= 0) {
                          timer.cancel();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("⏱️ Hết thời gian!"),
                              backgroundColor: Color(0xFF35A2B6),
                            ),
                          );
                        } else {
                          setState(() {
                            _sec--;
                          });
                        }
                      });
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Vui lòng nhập số hợp lệ!"),
                        backgroundColor: Color(0xFF35A2B6),
                      ),
                    );
                  }
                },
                label: Text("Bắt đầu"),
                icon: Icon(Icons.play_arrow),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF35A2B6),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _timer?.cancel();
                    _sec = 0;
                    _textController.text = "";
                  });
                },
                label: Text("Đặt lại"),
                icon: Icon(Icons.replay),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
