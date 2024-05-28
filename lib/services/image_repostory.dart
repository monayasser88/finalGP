import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jody/core/errors/exceptions.dart';
import 'package:jody/core/functions/upload_images_to_api.dart';
import 'package:jody/models/user_model.dart';

class ImageRepository {
  Future<Either<String, Profile>> uploadImageToApi({XFile? profilePic}) async {
    try {
      Dio dio = Dio();
        final response = await dio.put(
        'https://kemet-gp2024.onrender.com/api/v1/auth/updateProfile',
        data: {'profileImg': await UploadImageToApi(profilePic!)},
        options: Options(headers: {
          'token':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjMwNzI5NjAxMGI5ZTY2MWRiYWZiNmIiLCJyb2xlIjoidXNlciIsImlhdCI6MTcxNDQ1MTM2NH0.J1AatzRIpUdil5fjHg7w0SLJYQP6x_Fboop37EC1glY'
        }),
      );
      print(response);
        final imageUrl = response.data['user']['profileImg'];
        //return imageUrl;
        return Right(imageUrl);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }
}
