import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jody/components/custom_appbar.dart';
import 'package:jody/components/custom_container_in_profile.dart';
import 'package:jody/components/custom_edit_photo.dart';
import 'package:jody/components/custom_title_in_profile.dart';
import 'package:jody/components/custom_title_in_profile2.dart';
import 'package:jody/components/logout_pop_up.dart';
import 'package:jody/components/update_pop_up.dart';
import 'package:jody/constraints.dart';
import 'package:jody/cubit/profile_cubit.dart';
import 'package:jody/pages/change_password.dart';


class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late Dio dio;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dio = Dio();
    context.read<ProfileCubit>().getUserProfile(dio);
  }

  void updateFirstName(String firstName) {
    context
        .read<ProfileCubit>()
        .updateFirstName(firstName, dio, firstNameController);
  }

  void updateLastName(String lastName) {
    context
        .read<ProfileCubit>()
        .updateLastName(lastName, dio, lastNameController);
  }

  void updateCity(String city) {
    context.read<ProfileCubit>().updateCity(city, dio, cityController);
  }

  void showCustomPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const LogOutPopUp();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLoaded) {
          firstNameController.text = state.profile.firstName ?? '';
          lastNameController.text = state.profile.lastName ?? '';
          cityController.text = state.profile.city ?? '';
          emailController.text = state.profile.email ?? '';
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: SingleChildScrollView(
            child: SizedBox(
              height: 630,
              child: Column(
                children: [
                  const SizedBox(height: 55),
                  CustomAppBar(
                    title: 'Profile',
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(
                    height: 130,
                    child: PickImageWidget(),
                  ),
                  const SizedBox(height: 20),
                  CustomTitle(
                    titleProfile: 'First name',
                    onTap: () => showUpdateDialog(
                      context,
                      'Update First Name',
                      'Enter First Name',
                      firstNameController,
                      () async {
                        updateFirstName(firstNameController.text);
                        await Future.delayed(const Duration(seconds: 2));
                        setState(() {
                          context.read<ProfileCubit>().getUserProfile(dio);
                        });
                        Navigator.of(context).pop();
                      },
                    ),
                    userInfo: firstNameController.text,
                  ),
                  const SizedBox(height: 10),
                  CustomTitle(
                    titleProfile: 'Last name',
                    onTap: () => showUpdateDialog(
                      context,
                      'Update Last Name',
                      'Enter Last Name',
                      lastNameController,
                      () async {
                        updateLastName(lastNameController.text);
                        await Future.delayed(const Duration(seconds: 2));
                        setState(() {
                          context.read<ProfileCubit>().getUserProfile(dio);
                        });
                        Navigator.of(context).pop();
                      },
                    ),
                    userInfo: lastNameController.text,
                  ),
                  const SizedBox(height: 10),
                  CustomTitleEmail(
                    titleProfile: 'Email',
                    userInfo: emailController.text,
                  ),
                  const SizedBox(height: 10),
                  CustomTitle(
                    titleProfile: 'City',
                    onTap: () => showUpdateDialog(
                      context,
                      'Update City',
                      'Enter City',
                      cityController,
                      () async {
                        updateCity(cityController.text);
                        await Future.delayed(const Duration(seconds: 2));
                        setState(() {
                          context.read<ProfileCubit>().getUserProfile(dio);
                        });
                        Navigator.of(context).pop();
                      },
                    ),
                    userInfo: cityController.text,
                  ),
                  const SizedBox(height: 10),
                  const Flexible(
                    child: Divider(
                      thickness: 1,
                      color: Color(0xff92929D),
                      indent: 5,
                      endIndent: 5,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ContainerProfile(
                    forwardName: 'Change Password',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ChangePassword(),
                        ),
                      );
                    },
                  ),
                  ContainerProfile(
                    forwardName: 'Log out',
                    color: kPrimaryColor,
                    onTap: () => showCustomPopup(context),
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
