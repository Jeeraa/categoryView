import 'package:flutter/material.dart';
import 'package:pos_van/modules/menu/menu_view.dart';
import 'package:pos_van/modules/category/category_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CategoryView(),
    );
  }
}
