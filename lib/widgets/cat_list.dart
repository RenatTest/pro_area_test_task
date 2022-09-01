import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pro_area_test_task/cubit/cat_cubit.dart';
import 'package:pro_area_test_task/cubit/cat_state.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CatList extends StatefulWidget {
  @override
  _CatListState createState() => _CatListState();
}

class _CatListState extends State<CatList> {
  Box<String> catBox;

  @override
  void initState() {
    super.initState();
    catBox = Hive.box<String>('cats');
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    final CatCubit catCubit = context.bloc<CatCubit>();
    return BlocBuilder<CatCubit, CatState>(
      builder: (context, state) {
        if (state is CatEmptyState) {
          catCubit.fetchCats();
        }

        if (state is CatLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is CatLoadedState) {
          return ListView.builder(
              itemCount: state.loadedCat.length,
              itemBuilder: (context, index) {
                Random random = new Random();

                catBox.put(
                    state.loadedCat[index].name, state.loadedCat[index].phone);
                return Container(
                  color: index % 2 == 0 ? Colors.white : Colors.cyan,
                  child: ListTile(
                    leading: CachedNetworkImage(
                        imageUrl:
                            'https://cataas.com/cat/${random.nextInt(3) + random.nextInt(2)}',
                        placeholder: (context, url) => Container(
                            width: 20,
                            height: 20,
                            child: Center(child: CircularProgressIndicator())),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        imageBuilder: (context, imageBuilder) {
                          return CircleAvatar(
                            radius: 20,
                            backgroundImage: imageBuilder,
                          );
                        }),
                    title: Column(
                      children: [
                        Text(
                          'Cat name: ${state.loadedCat[index].name}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Cat phone: ${state.loadedCat[index].phone}',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              });
        }
        if (state is CatErrorState) {
          return Center(
            child: Text(
              'Error',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          );
        }

        return Container();
      },
    );
  }
}
