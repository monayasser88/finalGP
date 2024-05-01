import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jody/cubit/profile_cubit.dart';

class PhotoAccount extends StatelessWidget {
  PhotoAccount({super.key});
  //late ProfileCubit profileCubit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getUserProfile(Dio()),
      child:
          BlocConsumer<ProfileCubit, ProfileState>(listener: (context, state) {
        // TODO: implement listener
      }, builder: (context, state) {
        if (state is ProfileLoading) {
          const CircularProgressIndicator();
        }
        if (state is ProfileLoaded) {
          return SizedBox(
              width: 120,
              height: 120,
              child: CircleAvatar(
                backgroundColor: Colors.grey.shade200,
                backgroundImage: NetworkImage(state.profile.profilePic!),
              ));
        }
        return Container();
      }),
    );
  }
}
