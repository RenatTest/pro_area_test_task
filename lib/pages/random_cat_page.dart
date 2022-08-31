import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_area_test_task/cubit/cat_random_cubit.dart';
import 'package:pro_area_test_task/pages/random_cat_info.dart';
import 'package:pro_area_test_task/services/cat_random_repository.dart';

class RandomCatPage extends StatelessWidget {
  final int randomId;
  final catRandomRepository = RandomCatRepository();

  RandomCatPage({Key key, this.randomId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RandomCatCubit>(
      create: (context) => RandomCatCubit(catRandomRepository),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text('Cat Page'),
          centerTitle: true,
        ),
        body: RandomCatInfo(randomId: randomId),
      ),
    );
  }
}
