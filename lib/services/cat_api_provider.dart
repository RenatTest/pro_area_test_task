import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pro_area_test_task/models/cat.dart';

class CatProvider {
  Future<List<Cat>> getCat() async {
    final response =
        await http.get("https://jsonplaceholder.typicode.com/users");

    if (response.statusCode == 200) {
      final List<dynamic> catsJson = json.decode(response.body);
      return catsJson.map((json) => Cat.fromJson(json)).toList();
    } else {
      throw Exception("Error get cats");
    }
  }
}
