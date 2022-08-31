import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pro_area_test_task/models/cat.dart';

class CatRandomProvider {
  Future<Cat> getRandomCat(int id) async {
    final response =
        await http.get("https://jsonplaceholder.typicode.com/users/$id");

    if (response.statusCode == 200) {
      final Map<String, dynamic> catsJson = jsonDecode(response.body);
      return Cat.fromJson(catsJson);
    } else {
      throw Exception("Error get cat");
    }
  }
}
