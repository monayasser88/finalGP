import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jody/constraints.dart';
import 'package:jody/cubit/profile_cubit.dart';

class PickImageWidget extends StatefulWidget {
  const PickImageWidget({Key? key}) : super(key: key);

  @override
  _PickImageWidgetState createState() => _PickImageWidgetState();
}

class _PickImageWidgetState extends State<PickImageWidget> {
  late ProfileCubit profileCubit;
  late Dio dio;

  @override
  void initState() {
    super.initState();
    dio = Dio();
    profileCubit = context.read<ProfileCubit>();
  }

  bool isImagePickerActive = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is UploadPicture) {
          setState(() {
            isImagePickerActive = false;
          });
        }
      },
      builder: (context, state) {
        if (state is ProfileLoaded) {
          return SizedBox(
            width: 120,
            height: 120,
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade200,
              backgroundImage: NetworkImage(state.profile.profilePic!),
              //: const AssetImage('assets/person.png'),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: GestureDetector(
                      onTap: () async {
                        if (!isImagePickerActive) {
                          isImagePickerActive = true;
                          ImagePicker()
                              .pickImage(source: ImageSource.gallery)
                              .then((value) => context
                                  .read<ProfileCubit>()
                                  .updateProfilePic(value!));
                        }
                        isImagePickerActive = true;
                        setState(() {
                          profileCubit.getUserProfile(dio);
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          border: Border.all(color: Colors.white, width: 3),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: const Icon(
                          Icons.camera_alt_sharp,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
