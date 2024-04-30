import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jody/components/custom_appbar.dart';
import 'package:jody/components/favorites_legend_list_view.dart';
import 'package:jody/cubit/favorites_cubit.dart';


class FavoritesLegendPlaceView extends StatelessWidget {
  const FavoritesLegendPlaceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          children: [
            const SizedBox(
              height: 55,
            ),
            CustomAppBar(
              title: 'Favorites',
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
                child: BlocProvider(
              create: (context) =>
                  FavoritesCubit()..fetchFavoriteLegend(Dio()),
              child:const FavoritesLegendListView(),
            ))
          ],
        ),
      ),
    );
  }
}
