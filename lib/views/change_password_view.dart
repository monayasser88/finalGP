import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jody/components/custom_appbar2.dart';
import 'package:jody/components/custom_input_field.dart';
import 'package:jody/constraints.dart';
import 'package:jody/cubit/change_password_cubit.dart';


class ChangePasswordView extends StatelessWidget {
  ChangePasswordView({super.key});

  final _formKey = GlobalKey<FormState>();
  //late Dio dio;
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        if (state is ChangePasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Password changed successfully'),
              duration: Duration(seconds: 3),
            ),
          );
        } else if (state is ChangePasswordFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMassage),
              duration: const Duration(seconds: 3),
            ),
          );
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Column(
                children: [
                  const SizedBox(
                    height: 55,
                  ),
                  CustomAppBar2(
                    title: 'Change Password',
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  CustomInputField(
                    labelText: 'Current password',
                    hintText: 'Enter current password',
                    controller:
                        ChangePasswordCubit.get(context).oldPasswordController,
                    suffixIcon: true,
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomInputField(
                    labelText: 'New password',
                    hintText: 'Enter New password',
                    controller:
                        ChangePasswordCubit.get(context).newPasswordController,
                    obscureText: true,
                    suffixIcon: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomInputField(
                    labelText: 'Confirm New password',
                    hintText: 'Enter Confirm New password',
                    controller: ChangePasswordCubit.get(context)
                        .confirmNewPasswordController,
                    obscureText: true,
                    suffixIcon: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  state is ChangePasswordLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          style: const ButtonStyle(
                            minimumSize:
                                MaterialStatePropertyAll(Size(354, 44)),
                            shape:
                                MaterialStatePropertyAll(RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            )),
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(kPrimaryColor),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              ChangePasswordCubit.get(context)
                                  .changeUserPassword(Dio());
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('New passwords do not match'),
                                  duration: Duration(seconds: 3),
                                ),
                              );
                            }
                          },
                          child: const Text(
                            'Update',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
