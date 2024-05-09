import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jody/components/favorite_container.dart';
import 'package:jody/cubit/favorites_cubit.dart';
import 'package:jody/models/favorites_trip.dart';

class FavoritesTripsListView extends StatelessWidget {
  const FavoritesTripsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoritesCubit, FavoritesState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is FavoritesDeleting) {
          print('FavoritesDeleting state detected');
          return const Center(
            child: Text(
              'No favorites found.',
              style: TextStyle(fontFamily: 'poppins', fontSize: 20),
            ),
          );
        }
        return ConditionalBuilder(
          condition: state is! FavoriteLoading && state is FavoriteSuccess ||
              state is FavoritesDeleting,
          builder: (BuildContext context) => ListView.builder(
              itemBuilder: (context, index) => favList(
                  FavoritesCubit.get(context).trip.wishListTrip[index],
                  context),
              itemCount: FavoritesCubit.get(context).trip.wishListTrip.length),
          fallback: (BuildContext context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  Widget favList(Trips fav, context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: GestureDetector(
          onTap: () {
            //         Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => Legend(legend: {
            //       'title': fav.name,
            //       'description': fav.informationAbout,
            //       'images': fav.images,
            //       'imgCover': fav.imgCover,
            //       '_id': fav.id,
            //     }),
            //   ),
            // );
          },
          child: FavoriteContainer(
            description: fav.informationAbout,
            title: fav.name,
            image: fav.imgCover,
            onPressed: () {
              FavoritesCubit.get(context).deleteFavoriteTrips(Dio(), fav.id);
            },
          ),
        ),
      );
}
