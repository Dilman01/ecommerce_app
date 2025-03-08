import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';

import 'package:ecommerce_app/core/common/app/upload_image/data_source/upload_image_data_source.dart';
import 'package:ecommerce_app/core/common/app/upload_image/model/upload_image_model.dart';
import 'package:ecommerce_app/core/errors/failures.dart';

abstract interface class UploadImageRepo {
  Future<Either<Failure, UploadImageModel>> uploadImage({
    required XFile imageFile,
  });
}

class UploadImageRepoImpl implements UploadImageRepo {
  final UploadImageDataSource _uploadImageDataSource;

  const UploadImageRepoImpl(this._uploadImageDataSource);

  @override
  Future<Either<Failure, UploadImageModel>> uploadImage({
    required XFile imageFile,
  }) async {
    try {
      final uploadImageModel = await _uploadImageDataSource.uploadImage(
        imageFile: imageFile,
      );
      return right(uploadImageModel);
    } on Failure catch (e) {
      return left(e);
    }
  }
}
