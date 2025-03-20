part of 'get_all_admin_categories_bloc.dart';

sealed class GetAllAdminCategoriesEvent extends Equatable {
  const GetAllAdminCategoriesEvent();

  @override
  List<Object> get props => [];
}

final class FetchAllCategories extends GetAllAdminCategoriesEvent {
  final bool isLoading;

  const FetchAllCategories({required this.isLoading});

  @override
  List<Object> get props => [isLoading];
}
