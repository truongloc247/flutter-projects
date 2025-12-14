import 'dart:ui';

import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: myBody(), backgroundColor: Colors.white);
  }

  Widget myBody() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          taskBar(),
          SizedBox(height: 35),
          userName(),
          SizedBox(height: 15),
          search(),
          SizedBox(height: 35),
          Text("Saved Places", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          places(),
        ],
      ),
    );
  }

  Widget taskBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(onPressed: () => {}, icon: Icon(Icons.notifications)),
        IconButton(onPressed: () => {}, icon: Icon(Icons.extension)),
      ],
    );
  }

  Widget userName() {
    return RichText(
      text: TextSpan(
        text: "Welcome,\n",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
        children: [
          TextSpan(
            text: "Loc",
            style: TextStyle(fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }

  Widget search() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blue, width: 1.5),
        ),
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(Icons.search, color: Colors.blue),
      ),
    );
  }

  Widget places() {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            // child: Image.asset('assets/imgs/place-01.png', fit: BoxFit.cover),
            child: Image.network(
              "https://cdn.pixabay.com/photo/2023/07/09/17/30/eiffel-tower-8116627_1280.jpg",
              fit: BoxFit.cover,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            // child: Image.asset('assets/imgs/place-02.jpg', fit: BoxFit.cover),
            child: Image.network(
              "https://cdn.pixabay.com/photo/2017/08/05/09/27/architecture-2582566_1280.jpg",
              fit: BoxFit.cover,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            // child: Image.asset('assets/imgs/place-03.jpg', fit: BoxFit.cover),
            child: Image.network(
              "https://cdn.pixabay.com/photo/2024/08/25/16/58/ai-generated-8996996_1280.png",
              fit: BoxFit.cover,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            // child: Image.asset('assets/imgs/place-04.jpg', fit: BoxFit.cover),
            child: Image.network(
              "https://cdn.pixabay.com/photo/2025/04/26/19/45/mount-fuji-9561799_1280.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
