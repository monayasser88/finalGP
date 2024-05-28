import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jody/components/custom_appbar.dart';
import 'package:jody/components/custom_edit_photo.dart';
import 'package:jody/cubit/profile_cubit.dart';
import 'package:jody/views/profile_view.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  Dio dio = Dio();

  @override
  Widget build(BuildContext context) {
    final String previousScreen =
        ModalRoute.of(context)!.settings.arguments as String;
    return BlocProvider(
        create: (context) => ProfileCubit()..getUserProfile(dio),
        child: Scaffold(
          body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: SizedBox(
                  height: 680,
                  child: Column(children: [
                    const SizedBox(height: 55),
                    CustomAppBar(
                      title: 'Profile',
                      onTap: () {
                        if (previousScreen == 'account') {
                          Navigator.pushReplacementNamed(context, '/account');
                        } else if (previousScreen == 'settings') {
                          Navigator.pushReplacementNamed(context, '/settings');
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 130,
                      child: PickImageWidget(),
                    ),
                    const SizedBox(height: 20),
                    Flexible(child: ProfileView()),
                  ]),
                ),
              )),
        ));
  }
}
