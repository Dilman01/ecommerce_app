import 'package:ecommerce_app/core/services/hive/hive_database.dart';
import 'package:ecommerce_app/features/customer/product_details/domain/entities/product_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistInitial());

  Future<void> manageWishlist({required ProductEntity product}) async {
    emit(WishlistInitial());

    final existingIndex = HiveDatabase().wishlistBox!.values
        .toList()
        .indexWhere((element) => element.id == product.id);

    if (existingIndex >= 0) {
      await HiveDatabase().wishlistBox!.deleteAt(existingIndex);
    } else {
      await HiveDatabase().wishlistBox!.add(product);
    }
    emit(WishlistSuccess());
  }

  bool isFavorite(int id) {
    return HiveDatabase().wishlistBox!.values.toList().any(
      (element) => element.id == id,
    );
  }

  List<ProductEntity> get wishlistProducts {
    return HiveDatabase().wishlistBox!.values.toList().reversed.toList();
  }
}
