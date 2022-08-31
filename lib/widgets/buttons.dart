import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_area_test_task/cubit/cat_cubit.dart';
import 'package:pro_area_test_task/cubit/cat_state.dart';
import 'package:pro_area_test_task/pages/fact_history.dart';
import 'dart:math';

import 'package:pro_area_test_task/pages/random_cat_page.dart';

class Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    Random random = new Random();
    int randomId;

    return BlocBuilder<CatCubit, CatState>(builder: (context, state) {
      if (state is CatLoadedState) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                randomId = random.nextInt(state.loadedCat.length) + 1;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RandomCatPage(randomId: randomId)),
                );
              },
              child: Text("Another fact"),
              style: ElevatedButton.styleFrom(primary: Colors.lightGreen),
            ),
            SizedBox(
              width: 8.0,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FactHistory()),
                );
              },
              child: Text("Fact history"),
              style: ElevatedButton.styleFrom(primary: Colors.cyan),
            ),
          ],
        );
      }
      return Container();
    });
  }
}
