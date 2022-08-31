import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_area_test_task/cubit/cat_state.dart';
import 'package:pro_area_test_task/models/cat.dart';
import 'package:pro_area_test_task/services/cat_repository.dart';

class CatCubit extends Cubit<CatState> {
  final CatsRepository catsRepository;
  CatCubit(this.catsRepository) : super(CatEmptyState());

  Future<void> fetchCats() async {
    try {
      emit(CatLoadingState());
      final List<Cat> _loadedCatsList = await catsRepository.getAllCats();
      emit(CatLoadedState(loadedCat: _loadedCatsList));
    } catch (_) {
      emit(CatErrorState());
    }
  }

  // Future<void> getRandomCat(int id) async {
  //   try {
  //     emit(RandomCatLoadingState());
  //     final _loadedRandomCat = await catsRepository.getRandomCat(id);
  //     emit(RandomCatLoadedState(loadedRandomCat: _loadedRandomCat));
  //   } catch (_) {
  //     emit(RandomCatErrorState());
  //   }
  // }
}

// class RandomCatCubit extends Cubit<RandomCatState> {
//   final RandomCatsRepository randomCatsRepository;
//   RandomCatCubit(this.randomCatsRepository) : super(RandomCatEmptyState());

//   Future<void> getRandomCat(int id) async {
//     try {
//       emit(RandomCatLoadingState());
//       final _loadedRandomCat = await randomCatsRepository.getRandomCat(id);
//       emit(RandomCatLoadedState(loadedRandomCat: _loadedRandomCat));
//     } catch (_) {
//       emit(RandomCatErrorState());
//     }
//   }
// }
