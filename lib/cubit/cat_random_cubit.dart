import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_area_test_task/cubit/cat_random_state.dart';
import 'package:pro_area_test_task/services/cat_random_repository.dart';

class RandomCatCubit extends Cubit<RandomCatState> {
  final RandomCatRepository randomCatsRepository;
  RandomCatCubit(this.randomCatsRepository) : super(RandomCatEmptyState());

  Future<void> getRandomCat(int id) async {
    try {
      emit(RandomCatLoadingState());
      final _loadedRandomCat = await randomCatsRepository.getRandomCat(id);
      emit(RandomCatLoadedState(loadedRandomCat: _loadedRandomCat));
    } catch (_) {
      emit(RandomCatErrorState());
    }
  }
}
