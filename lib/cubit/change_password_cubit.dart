import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jody/core/api/end_ponits.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());
  //final ApiConsumer api;
  static ChangePasswordCubit get(context) => BlocProvider.of(context);
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

  void changeUserPassword(Dio dio) async {
    //final token = CacheHelper().getData(key: ApiKey.token);
    emit(ChangePasswordLoading());
    if (newPasswordController.text != confirmNewPasswordController.text) {
      emit(ChangePasswordFailure(
          'New password and Confirm New Password do not match!'));
    }
    //final token =
    //'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjMwNzI5NjAxMGI5ZTY2MWRiYWZiNmIiLCJyb2xlIjoidXNlciIsImlhdCI6MTcxNDQ1MTM2NH0.J1AatzRIpUdil5fjHg7w0SLJYQP6x_Fboop37EC1glY';
    // // CacheHelper().getData(key: ApiKey.token);

    //if (token == null) {
    //emit(ChangePasswordFailure('User ID not found in cache.'));
    //}
    try {
      final response = await dio.patch(EndPoint.getChangePasswordEndPoint,
          data: {
            'currentPassword': oldPasswordController.text,
            'newPassword': newPasswordController.text,
            'reNewPassword': confirmNewPasswordController.text,
          },
          options: Options(headers: {
            'token':
                'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjU0OWE5M2NiZDM0NmYwZTJiNGU4YmMiLCJyb2xlIjoidXNlciIsImlhdCI6MTcxNjkwODQ2NX0.IRooS9LricFdGtXQ8jaPIE8OQBazXUQp3kkFfzN_w4g'
          }));
      print(response.data);
      if (response.statusCode == 200) {
        //final token = response.data['token'];
        //CacheHelper().saveData(key: ApiKey.token, value: token);
        emit(ChangePasswordSuccess());
      } else if (response.statusCode == 401) {
        emit(ChangePasswordFailure('password incorrect'));
      }
    } catch (e) {
      emit(ChangePasswordFailure(e.toString()));
    }
  }
}
