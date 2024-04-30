import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jody/cache/cache_helper.dart';
import 'package:jody/core/api/end_ponits.dart';
import 'package:meta/meta.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());
  static LogoutCubit get(context) => BlocProvider.of(context);

  void logout2(Dio dio) async {
    emit(LogoutLoading());
    final token = CacheHelper().getDataString(key: ApiKey.token);
    // if (token == null) {
    //   return;
    // }
    try {
      //dioConsumer.dio.options.headers['token'] = token;
      final response = await dio.patch(EndPoint.logoutEndpoint,
          options: Options(headers: {
            "token":
                "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjFjNmI5MzY3OTkzMmU2Nzc3MTg5YWMiLCJyb2xlIjoidXNlciIsImlhdCI6MTcxNDEwNDU1Nn0.ZWKShnx5B9dN6atvB2q7os-ZbB_7uDB8RuS_2gdO0Vs"
          }));
      if (response.statusCode == 200) {
        emit(LoggedOutSuccess());
        print('Logout successful');
        //await CacheHelper().removeData(key: ApiKey.token);
      } else {
        emit(LogoutFailure('error in statusCode'));
      }
    } catch (e) {
      emit(LogoutFailure('can not log out'));
    }
  }
}
