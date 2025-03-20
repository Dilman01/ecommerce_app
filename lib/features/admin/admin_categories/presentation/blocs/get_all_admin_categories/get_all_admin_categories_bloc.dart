import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_app/core/usecase/usecase.dart';
import 'package:ecommerce_app/features/admin/admin_categories/domain/entity/admin_category_entity.dart';
import 'package:ecommerce_app/features/admin/admin_categories/domain/usecases/get_all_admin_categories_usecase.dart';

part 'get_all_admin_categories_event.dart';
part 'get_all_admin_categories_state.dart';

class GetAllAdminCategoriesBloc
    extends Bloc<GetAllAdminCategoriesEvent, GetAllAdminCategoriesState> {
  final GetAllAdminCategoriesUsecase _getAllAdminCategoriesUsecase;

  GetAllAdminCategoriesBloc({
    required GetAllAdminCategoriesUsecase getAllAdminCategoriesUsecase,
  }) : _getAllAdminCategoriesUsecase = getAllAdminCategoriesUsecase,
       super(GetAllAdminCategoriesInitial()) {
    on<FetchAllCategories>(_onFetchAllCategories);
  }

  Future<void> _onFetchAllCategories(
    FetchAllCategories event,
    Emitter<GetAllAdminCategoriesState> emit,
  ) async {
    if (event.isLoading) {
      emit(GetAllAdminCategoriesLoading());
    }

    final response = await _getAllAdminCategoriesUsecase(NoParams());

    response.fold(
      (l) => emit(GetAllAdminCategoriesFailure(l.message)),
      (categories) =>
          emit(GetAllAdminCategoriesSuccess(categories.reversed.toList())),
    );
  }
}
