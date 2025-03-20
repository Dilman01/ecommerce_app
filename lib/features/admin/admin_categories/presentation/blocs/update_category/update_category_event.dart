part of 'update_category_bloc.dart';

sealed class UpdateCategoryEvent extends Equatable {
  const UpdateCategoryEvent();

  @override
  List<Object> get props => [];
}

final class UpdateCategory extends UpdateCategoryEvent {
  const UpdateCategory(this.body);

  final UpdateCategoryReqBody body;

  @override
  List<Object> get props => [body];
}
