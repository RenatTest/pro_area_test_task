import 'package:flutter/material.dart';
import 'package:pro_area_test_task/pages/cats_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CatsPage(),
    );
  }
}
