import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_area_test_task/cubit/cat_cubit.dart';
import 'package:pro_area_test_task/services/cat_repository.dart';
import 'package:pro_area_test_task/widgets/buttons.dart';
import 'package:pro_area_test_task/widgets/cat_list.dart';

class CatsPage extends StatelessWidget {
  final catsRepository = CatsRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CatCubit>(
      create: (context) => CatCubit(catsRepository),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text('Cats List'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Buttons(),
            Expanded(child: CatList()),
          ],
        ),
      ),
    );
  }
}
