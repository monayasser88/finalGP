import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:jody/cache/cache_helper.dart';
import 'package:jody/core/api/end_ponits.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());
  //final ApiConsumer api;
  static ChangePasswordCubit get(context) => BlocProvider.of(context);
  Future<void> changePassword(String oldPassword, String newPassword) async {
    emit(ChangePasswordLoading());

    try {
      final response = await http.post(
        Uri.parse(''),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'userId': oldPassword, 'newPassword': newPassword}),
      );

      if (response.statusCode == 200) {
        emit(ChangePasswordSuccess());
      } else {
        emit(ChangePasswordFailure('Failed to change password'));
      }
    } catch (error) {
      emit(ChangePasswordFailure('Failed to change password'));
    }
  }

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

  void changeUserPassword(Dio dio) async {
    final token = CacheHelper().getData(key: ApiKey.token);
    emit(ChangePasswordLoading());
    if (newPasswordController.text != confirmNewPasswordController.text) {
      throw 'New password and confirm new password do not match.';
    }
    //final token =
    // 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjFjNmI5MzY3OTkzMmU2Nzc3MTg5YWMiLCJyb2xlIjoidXNlciIsImlhdCI6MTcxMzkyOTcyMH0.rJsfUjsKBINCC4L4tIWxFWaOFd3A9xbVqgxeA2CD2b8';
    // // CacheHelper().getData(key: ApiKey.token);

    if (token == null) {
      emit(ChangePasswordFailure('User ID not found in cache.'));
    }
    try {
      final response = await dio.patch(EndPoint.getChangePasswordEndPoint,
          data: {
            'currentPassword': oldPasswordController.text,
            'newPassword': newPasswordController.text,
            'reNewPassword': confirmNewPasswordController.text,
          },
          options: Options(headers: {'token': token}));
      print(response.data);
      if (response.statusCode == 200) {
        CacheHelper().saveData(key: ApiKey.token, value: token);
        emit(ChangePasswordSuccess());
      }
    } catch (e) {
      emit(ChangePasswordFailure(e.toString()));
    }
  }
}
