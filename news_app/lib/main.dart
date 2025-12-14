import 'package:flutter/material.dart';
import 'package:news_app/news_list_page.dart';

void main() {
  runApp(MyNewsApp());
}

class MyNewsApp extends StatelessWidget {
  const MyNewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: NewsListPage());
  }
}
