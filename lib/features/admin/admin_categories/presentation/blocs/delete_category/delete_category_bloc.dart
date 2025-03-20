import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_app/features/admin/admin_categories/domain/usecases/delete_category_usecase.dart';

part 'delete_category_event.dart';
part 'delete_category_state.dart';

class DeleteCategoryBloc
    extends Bloc<DeleteCategoryEvent, DeleteCategoryState> {
  final DeleteCategoryUsecase _deleteCategoryUsecase;

  DeleteCategoryBloc({required DeleteCategoryUsecase deleteCategoryUsecase})
    : _deleteCategoryUsecase = deleteCategoryUsecase,
      super(DeleteCategoryInitial()) {
    on<DeleteCategory>(_onDeleteCategory);
  }

  Future<void> _onDeleteCategory(
    DeleteCategory event,
    Emitter<DeleteCategoryState> emit,
  ) async {
    emit(DeleteCategoryLoading(event.id));

    final response = await _deleteCategoryUsecase(event.id);

    response.fold(
      (l) => emit(DeleteCategoryFailure(l.message, event.id)),
      (r) => emit(DeleteCategorySuccess(event.id)),
    );
  }
}
