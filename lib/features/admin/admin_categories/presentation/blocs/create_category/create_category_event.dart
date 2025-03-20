part of 'create_category_bloc.dart';

sealed class CreateCategoryEvent extends Equatable {
  const CreateCategoryEvent();

  @override
  List<Object> get props => [];
}

final class CreateCategory extends CreateCategoryEvent {
  final CreateCategoryReqBody body;
  const CreateCategory(this.body);

  @override
  List<Object> get props => [body];
}
