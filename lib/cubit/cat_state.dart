import 'package:flutter/foundation.dart';

abstract class CatState {}

class CatEmptyState extends CatState {}

class CatLoadingState extends CatState {}

class CatLoadedState extends CatState {
  List<dynamic> loadedCat;
  CatLoadedState({@required this.loadedCat}) : assert(loadedCat != null);
}

class CatErrorState extends CatState {}

// abstract class RandomCatState {}

// class RandomCatEmptyState extends RandomCatState {}

// class RandomCatLoadingState extends RandomCatState {}

// class RandomCatLoadedState extends RandomCatState {
//   var loadedRandomCat;
//   RandomCatLoadedState({@required this.loadedRandomCat})
//       : assert(loadedRandomCat != null);
// }

// class RandomCatErrorState extends RandomCatState {}
