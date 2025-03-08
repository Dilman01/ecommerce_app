import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import 'package:ecommerce_app/core/common/app/upload_image/model/upload_image_model.dart';
import 'package:ecommerce_app/core/constants/api_constants.dart';
import 'package:ecommerce_app/core/services/network/dio_client.dart';

abstract interface class UploadImageDataSource {
  Future<UploadImageModel> uploadImage({required XFile imageFile});
}

class UploadImageDataSourceImpl implements UploadImageDataSource {
  final DioClient _dio;

  const UploadImageDataSourceImpl(this._dio);

  @override
  Future<UploadImageModel> uploadImage({required XFile imageFile}) async {
    final formData = FormData();

    formData.files.add(
      MapEntry('file', await MultipartFile.fromFile(imageFile.path)),
    );
    final response = await _dio.post(
      ApiConstants.upload,
      data: formData,
      options: Options(headers: {'Content-Type': 'multipart/form-data'}),
    );
    return UploadImageModel.fromJson(response.data);
  }
}
