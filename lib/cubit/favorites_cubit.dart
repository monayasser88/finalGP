import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jody/core/api/end_ponits.dart';
import 'package:jody/core/errors/exceptions.dart';
import 'package:jody/models/favorites.dart';
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
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjFjNmI5MzY3OTkzMmU2Nzc3MTg5YWMiLCJyb2xlIjoidXNlciIsImlhdCI6MTcxNDEwMzI1OH0.czUhubKtmMKQMf5lX7SJBz01nxLuzIfabC8nyAAWde8"
          }));
      tourismPlace = WishlistResponse.fromJson(response.data);
      emit(FavoriteSuccess());
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
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjFjNmI5MzY3OTkzMmU2Nzc3MTg5YWMiLCJyb2xlIjoidXNlciIsImlhdCI6MTcxNDEwMzI1OH0.czUhubKtmMKQMf5lX7SJBz01nxLuzIfabC8nyAAWde8"
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

    void fetchFavoriteTrips(Dio dio) async {
    // final token = CacheHelper().getData(key: ApiKey.token);

    // if (token == null) {
    //   emit(FavoriteTripsError('User ID not found in cache.'));
    // }
    emit(FavoriteLoading());
    try {
      var response = await dio.get(EndPoint.tripsWishList,
          options: Options(headers: {
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjFjNmI5MzY3OTkzMmU2Nzc3MTg5YWMiLCJyb2xlIjoidXNlciIsImlhdCI6MTcxNDEwMzI1OH0.czUhubKtmMKQMf5lX7SJBz01nxLuzIfabC8nyAAWde8"
          }));
      tourismPlace = WishlistResponse.fromJson(response.data);
      emit(FavoriteSuccess());
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
      var response = await dio.delete(EndPoint.deleteTourismWishList(favId),
          options: Options(headers: {
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjFjNmI5MzY3OTkzMmU2Nzc3MTg5YWMiLCJyb2xlIjoidXNlciIsImlhdCI6MTcxNDEwMzI1OH0.czUhubKtmMKQMf5lX7SJBz01nxLuzIfabC8nyAAWde8"
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

      void fetchFavoriteLegend(Dio dio) async {
    // final token = CacheHelper().getData(key: ApiKey.token);

    // if (token == null) {
    //   emit(FavoriteTripsError('User ID not found in cache.'));
    // }
    emit(FavoriteLoading());
    try {
      var response = await dio.get(EndPoint.legendWishList,
          options: Options(headers: {
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjFjNmI5MzY3OTkzMmU2Nzc3MTg5YWMiLCJyb2xlIjoidXNlciIsImlhdCI6MTcxNDEwMzI1OH0.czUhubKtmMKQMf5lX7SJBz01nxLuzIfabC8nyAAWde8"
          }));
      tourismPlace = WishlistResponse.fromJson(response.data);
      emit(FavoriteSuccess());
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
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjFjNmI5MzY3OTkzMmU2Nzc3MTg5YWMiLCJyb2xlIjoidXNlciIsImlhdCI6MTcxNDEwMzI1OH0.czUhubKtmMKQMf5lX7SJBz01nxLuzIfabC8nyAAWde8"
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
}
