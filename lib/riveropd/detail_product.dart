import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hala_sat_task/core/models/detail_product.dart';
import 'package:hala_sat_task/core/repository/detail_product.dart';

final productFutureProvider = FutureProvider.autoDispose((ref) {
  final Future<DetailProduct> detailProduct;
  final DetailProductRepository detailProductRepository =
      DetailProductRepository(ref.read(idProvider.notifier).state!);

  detailProduct = detailProductRepository.getDetailProductModel();
  return detailProduct;
});

final idProvider = StateProvider<int?>((ref) => null);
