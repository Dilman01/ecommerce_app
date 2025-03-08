part of 'categories_bloc.dart';

sealed class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoading extends CategoriesState {}

final class AllCategoriesLoaded extends CategoriesState {
  final List<CategoryEntity> categories;
  const AllCategoriesLoaded(this.categories);

  @override
  List<Object> get props => [categories];
}

final class CategoriesFailure extends CategoriesState {
  final String message;
  const CategoriesFailure(this.message);

  @override
  List<Object> get props => [message];
}
