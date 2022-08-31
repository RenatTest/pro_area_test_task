import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_area_test_task/cubit/cat_random_cubit.dart';
import 'package:pro_area_test_task/cubit/cat_random_state.dart';

class RandomCatInfo extends StatelessWidget {
  final int randomId;

  const RandomCatInfo({Key key, this.randomId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    final RandomCatCubit randomCatCubit = context.bloc<RandomCatCubit>();
    return BlocBuilder<RandomCatCubit, RandomCatState>(
      builder: (context, state) {
        if (state is RandomCatEmptyState) {
          randomCatCubit.getRandomCat(randomId);
        }

        if (state is RandomCatLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is RandomCatLoadedState) {
          return Container(
            height: 80,
            color: Colors.lightGreen,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CachedNetworkImage(
                    imageUrl: 'https://cataas.com/cat',
                    placeholder: (context, url) => Container(
                        width: 40,
                        height: 40,
                        child: Center(child: CircularProgressIndicator())),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    imageBuilder: (context, imageBuilder) {
                      return CircleAvatar(
                        radius: 40,
                        backgroundImage: imageBuilder,
                      );
                    }),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Cat name: ${state.loadedRandomCat.name}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Cat phone: ${state.loadedRandomCat.phone}',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
        if (state is RandomCatErrorState) {
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
