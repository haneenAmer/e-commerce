import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hala_sat_task/core/models/product_list_models.dart';
import 'package:hala_sat_task/core/repository/product_list_repository.dart';

final productListFutureProvider = FutureProvider.autoDispose((ref) {
  Future<Products> products;
  final ProductListRepository productListRepository = ProductListRepository();

  products = productListRepository.geProductLitModels();
  print("rever${products}");
  print('hi from riverpod');
  return products;
});
