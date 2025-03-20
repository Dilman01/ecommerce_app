part of 'delete_category_bloc.dart';

sealed class DeleteCategoryEvent extends Equatable {
  const DeleteCategoryEvent();

  @override
  List<Object> get props => [];
}

final class DeleteCategory extends DeleteCategoryEvent {
  final int id;

  const DeleteCategory(this.id);

  @override
  List<Object> get props => [id];
}
