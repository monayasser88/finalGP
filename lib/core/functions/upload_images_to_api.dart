import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jody/cubit/profile_cubit.dart';

Future UploadImageToApi(XFile image) async {
return MultipartFile.fromFile(image.path, filename: image.path.split('/').last);
}
