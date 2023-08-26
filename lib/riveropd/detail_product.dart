import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hala_sat_task/core/models/detail_product.dart';
import 'package:hala_sat_task/core/repository/detail_product.dart';

final mealsFutureProvider = FutureProvider.autoDispose((ref) {
  Future<DetailProduct> detailProduct;
  final DetailProductRepository detailProductRepository =
      DetailProductRepository(ref.watch(idProvider.notifier).state ?? '');

  detailProduct = detailProductRepository.getDetailProductModel();
  print("i am here 3");
  return detailProduct;
});

final idProvider = StateProvider<String?>((ref) => null);
