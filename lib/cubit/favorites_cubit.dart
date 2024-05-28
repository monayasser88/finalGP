import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jody/core/api/end_ponits.dart';
import 'package:jody/core/errors/exceptions.dart';
import 'package:jody/models/favorites_legand.dart';
import 'package:jody/models/favorites_tourism.dart';
import 'package:jody/models/favorites_trip.dart';
import 'package:meta/meta.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());

  static FavoritesCubit get(context) => BlocProvider.of(context);

  late WishlistResponse tourismPlace;
  void fetchFavoriteTourismPlaces(Dio dio) async {
    // final token = CacheHelper().getData(key: ApiKey.token);

    // if (token == null) {
    //   emit(FavoriteTripsError('User ID not found in cache.'));
    // }
    emit(FavoriteLoading());
    try {
      var response = await dio.get(EndPoint.tourismWishList,
          options: Options(headers: {
            "token":
                "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjMwNzI5NjAxMGI5ZTY2MWRiYWZiNmIiLCJyb2xlIjoidXNlciIsImlhdCI6MTcxNDQ1MTM2NH0.J1AatzRIpUdil5fjHg7w0SLJYQP6x_Fboop37EC1glY"
          }));
      var wishListTourismPlace = response.data['wishListTourismPlace'] as List;
      if (wishListTourismPlace.isEmpty) {
        emit(FavoritesDeleting());
      } else {
        tourismPlace = WishlistResponse.fromJson(response.data);
        emit(FavoriteSuccess());
      }
    } on ServerException catch (error) {
      print(error.toString());
      emit(FavoriteError('can not load tourism places '));
    }
  }

  void deleteFavoriteTourismPlaces(Dio dio, String favId) async {
    // final token = CacheHelper().getData(key: ApiKey.token);

    // if (token == null) {
    //   emit(FavoriteTripsError('User ID not found in cache.'));
    // }
    emit(FavoriteLoading());
    try {
      var response = await dio.delete(EndPoint.deleteTourismWishList(favId),
          options: Options(headers: {
            "token":
                "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjMwNzI5NjAxMGI5ZTY2MWRiYWZiNmIiLCJyb2xlIjoidXNlciIsImlhdCI6MTcxNDQ1MTM2NH0.J1AatzRIpUdil5fjHg7w0SLJYQP6x_Fboop37EC1glY"
          }));
      if (response.statusCode == 200) {
        //Future.delayed(const Duration(seconds: 2));

        emit(FavoritesDeleting());
        fetchFavoriteTourismPlaces(dio);
      } else {
        emit(FavoriteError('Failed to delete favorite tourism place.'));
      }
    } catch (error) {
      print(error.toString());
      emit(FavoriteError('Failed to delete favorite tourism place.'));
    }
  }

  late WishlistResponseTrip trip = WishlistResponseTrip(
    msg: '',
    wishListTrip: [],
  );
  void fetchFavoriteTrips(Dio dio) async {
    // final token = CacheHelper().getData(key: ApiKey.token);

    // if (token == null) {
    //   emit(FavoriteTripsError('User ID not found in cache.'));
    // }
    emit(FavoriteLoading());
    try {
      var response = await dio.get(EndPoint.tripsWishList,
          options: Options(headers: {
            "token":
                "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjU0OWE5M2NiZDM0NmYwZTJiNGU4YmMiLCJyb2xlIjoidXNlciIsImlhdCI6MTcxNjkwODQ2NX0.IRooS9LricFdGtXQ8jaPIE8OQBazXUQp3kkFfzN_w4g"
          }));
      var wishListTrip = response.data['wishListTrip'] as List;
      if (wishListTrip.isEmpty) {
        emit(FavoritesDeleting());
      } else {
        trip = WishlistResponseTrip.fromJson(response.data);
        emit(FavoriteSuccess());
      }
    } on ServerException catch (error) {
      print(error.toString());
      emit(FavoriteError('can not load tourism places '));
    }
  }

  void deleteFavoriteTrips(Dio dio, String favId) async {
    // final token = CacheHelper().getData(key: ApiKey.token);

    // if (token == null) {
    //   emit(FavoriteTripsError('User ID not found in cache.'));
    // }
    emit(FavoriteLoading());
    try {
      var response = await dio.delete(EndPoint.deleteTripWishList(favId),
          options: Options(headers: {
            "token":
                "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjU0OWE5M2NiZDM0NmYwZTJiNGU4YmMiLCJyb2xlIjoidXNlciIsImlhdCI6MTcxNjkwODQ2NX0.IRooS9LricFdGtXQ8jaPIE8OQBazXUQp3kkFfzN_w4g"
          }));
      if (response.statusCode == 200) {
        //Future.delayed(const Duration(seconds: 2));

        emit(FavoritesDeleting());
        fetchFavoriteTrips(dio);
      } else {
        emit(FavoriteError('Failed to delete favorite tourism place.'));
      }
    } catch (error) {
      print(error.toString());
      emit(FavoriteError('Failed to delete favorite tourism place.'));
    }
  }

  late WishlistResponseLegand favoriteLegand;
  void fetchFavoriteLegend(Dio dio) async {
    // final token = CacheHelper().getData(key: ApiKey.token);

    // if (token == null) {
    //   emit(FavoriteTripsError('User ID not found in cache.'));
    // }
    emit(FavoriteLoading());
    try {
      var response = await dio.get(EndPoint.legendWishList,
          options: Options(headers: {
            "token":
                "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjMwNzI5NjAxMGI5ZTY2MWRiYWZiNmIiLCJyb2xlIjoidXNlciIsImlhdCI6MTcxNDQ1MTM2NH0.J1AatzRIpUdil5fjHg7w0SLJYQP6x_Fboop37EC1glY"
          }));
      var wishListLegand = response.data['wishListLegend'] as List;
      if (wishListLegand.isEmpty) {
        emit(FavoritesDeleting());
      } else {
        favoriteLegand = WishlistResponseLegand.fromJson(response.data);
        emit(FavoriteSuccess());
      }
    } on ServerException catch (error) {
      print(error.toString());
      emit(FavoriteError('can not load tourism places '));
    }
  }

  void deleteFavoriteLegend(Dio dio, String favId) async {
    // final token = CacheHelper().getData(key: ApiKey.token);

    // if (token == null) {
    //   emit(FavoriteTripsError('User ID not found in cache.'));
    // }
    emit(FavoriteLoading());
    try {
      var response = await dio.delete(EndPoint.deleteLegendWishList(favId),
          options: Options(headers: {
            "token":
                "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjMwNzI5NjAxMGI5ZTY2MWRiYWZiNmIiLCJyb2xlIjoidXNlciIsImlhdCI6MTcxNDQ1MTM2NH0.J1AatzRIpUdil5fjHg7w0SLJYQP6x_Fboop37EC1glY"
          }));
      if (response.statusCode == 200) {
        //Future.delayed(const Duration(seconds: 2));

        emit(FavoritesDeleting());
        fetchFavoriteLegend(dio);
      } else {
        emit(FavoriteError('Failed to delete favorite tourism place.'));
      }
    } catch (error) {
      print(error.toString());
      emit(FavoriteError('Failed to delete favorite tourism place.'));
    }
  }
}
