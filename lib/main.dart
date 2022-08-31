import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pro_area_test_task/pages/cats_page.dart';
import 'models/cat.dart';

Box box;
Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CatAdapter());
  box = await Hive.openBox('box');
  box.put('cat', Cat(id: 1, name: 'CatName', phone: 'Cat Phone 33333'));
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
