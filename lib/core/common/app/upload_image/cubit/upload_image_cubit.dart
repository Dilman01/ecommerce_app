import 'package:ecommerce_app/core/common/app/upload_image/repo/upload_image_repo.dart';
import 'package:ecommerce_app/core/utils/pick_image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:equatable/equatable.dart';

part 'upload_image_state.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  UploadImageCubit(this._repo) : super(UploadImageInitial());

  final UploadImageRepo _repo;

  String getImageUrl = '';

  Future<void> uploadImage(BuildContext context) async {
    final pickedImage = await PickImageUtils().pickImage(context);

    if (pickedImage == null) return;

    emit(UploadImageLoading());

    final result = await _repo.uploadImage(imageFile: pickedImage);

    result.fold((l) => emit(UploadImageError(l.message)), (image) {
      getImageUrl = image.location ?? '';

      emit(UploadImageSuccess());
    });
  }

  void removeImage() {
    getImageUrl = '';
    emit(UploadImageRemove(imageUrl: getImageUrl));
  }
}
