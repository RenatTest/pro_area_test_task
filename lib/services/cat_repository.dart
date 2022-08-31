import 'package:pro_area_test_task/models/cat.dart';
import 'package:pro_area_test_task/services/cat_api_provider.dart';

class CatsRepository {
  CatProvider _catProvider = CatProvider();
  Future<List<Cat>> getAllCats() => _catProvider.getCat();
}
