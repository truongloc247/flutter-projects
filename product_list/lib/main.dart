import 'package:flutter/material.dart';
import 'package:product_list/product_list.dart';

void main() {
  runApp(ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ProductList());
  }
}
