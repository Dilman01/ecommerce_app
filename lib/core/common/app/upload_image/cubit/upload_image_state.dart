part of 'upload_image_cubit.dart';

sealed class UploadImageState extends Equatable {
  const UploadImageState();

  @override
  List<Object> get props => [];
}

final class UploadImageInitial extends UploadImageState {}

final class UploadImageLoading extends UploadImageState {}

final class UploadImageSuccess extends UploadImageState {}

final class UploadImageError extends UploadImageState {
  final String message;

  const UploadImageError(this.message);

  @override
  List<Object> get props => [message];
}

final class UploadImageRemove extends UploadImageState {
  final String imageUrl;

  const UploadImageRemove({required this.imageUrl});

  @override
  List<Object> get props => [imageUrl];
}
