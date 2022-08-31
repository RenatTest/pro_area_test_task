import 'package:flutter/material.dart';

abstract class RandomCatState {}

class RandomCatEmptyState extends RandomCatState {}

class RandomCatLoadingState extends RandomCatState {}

class RandomCatLoadedState extends RandomCatState {
  var loadedRandomCat;
  RandomCatLoadedState({@required this.loadedRandomCat})
      : assert(loadedRandomCat != null);
}

class RandomCatErrorState extends RandomCatState {}
