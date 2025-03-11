import 'package:ecommerce_app/features/customer/product_details/data/model/product_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:ecommerce_app/features/customer/product_details/domain/entities/product_entity.dart';

class HiveDatabase {
  factory HiveDatabase() => _instance;

  HiveDatabase._();

  static final HiveDatabase _instance = HiveDatabase._();

  Box<ProductEntity>? wishlistBox;

  Future<void> setUp() async {
    await Hive.initFlutter();

    Hive
      ..registerAdapter(ProductEntityAdapter())
      ..registerAdapter(CategoryProductModelAdapter());

    wishlistBox = await Hive.openBox<ProductEntity>('wishlist_box');
  }

  Future<void> clearAllBox() async {
    await wishlistBox!.clear();
  }
}
