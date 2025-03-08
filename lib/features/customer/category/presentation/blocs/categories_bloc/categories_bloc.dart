import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_app/core/usecase/usecase.dart';
import 'package:ecommerce_app/features/customer/category/domain/entities/category_entity.dart';
import 'package:ecommerce_app/features/customer/category/domain/usecases/get_all_categories_usecase.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final GetAllCategoriesUsecase _getAllCategoriesUsecase;

  CategoriesBloc({required GetAllCategoriesUsecase getAllCategoriesUsecase})
    : _getAllCategoriesUsecase = getAllCategoriesUsecase,
      super(CategoriesInitial()) {
    on<GetAllCategories>(_onGetAllCategories);
  }

  Future<void> _onGetAllCategories(
    GetAllCategories event,
    Emitter<CategoriesState> emit,
  ) async {
    emit(CategoriesLoading());
    final result = await _getAllCategoriesUsecase(NoParams());
    result.fold(
      (failure) => emit(CategoriesFailure(failure.message)),
      (categories) => emit(AllCategoriesLoaded(categories)),
    );
  }
}
