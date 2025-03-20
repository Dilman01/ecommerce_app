part of 'get_all_admin_categories_bloc.dart';

sealed class GetAllAdminCategoriesState extends Equatable {
  const GetAllAdminCategoriesState();

  @override
  List<Object> get props => [];
}

final class GetAllAdminCategoriesInitial extends GetAllAdminCategoriesState {}

final class GetAllAdminCategoriesLoading extends GetAllAdminCategoriesState {}

final class GetAllAdminCategoriesSuccess extends GetAllAdminCategoriesState {
  final List<AdminCategoryEntity> categories;

  const GetAllAdminCategoriesSuccess(this.categories);

  @override
  List<Object> get props => [categories];
}

final class GetAllAdminCategoriesFailure extends GetAllAdminCategoriesState {
  final String message;

  const GetAllAdminCategoriesFailure(this.message);

  @override
  List<Object> get props => [message];
}
