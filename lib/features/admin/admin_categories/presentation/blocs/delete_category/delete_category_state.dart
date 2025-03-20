part of 'delete_category_bloc.dart';

sealed class DeleteCategoryState extends Equatable {
  const DeleteCategoryState();

  @override
  List<Object> get props => [];
}

final class DeleteCategoryInitial extends DeleteCategoryState {}

final class DeleteCategoryLoading extends DeleteCategoryState {
  final int id;

  const DeleteCategoryLoading(this.id);

  @override
  List<Object> get props => [id];
}

final class DeleteCategorySuccess extends DeleteCategoryState {
  final int id;
  const DeleteCategorySuccess(this.id);

  @override
  List<Object> get props => [id];
}

final class DeleteCategoryFailure extends DeleteCategoryState {
  final String message;
  final int id;
  const DeleteCategoryFailure(this.message, this.id);

  @override
  List<Object> get props => [message, id];
}
