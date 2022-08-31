import 'package:pro_area_test_task/models/cat.dart';
import 'package:pro_area_test_task/services/cat_random_api_provider.dart';

class RandomCatRepository {
  CatRandomProvider _catRandomProvider = CatRandomProvider();
  Future<Cat> getRandomCat(int id) => _catRandomProvider.getRandomCat(id);
}
