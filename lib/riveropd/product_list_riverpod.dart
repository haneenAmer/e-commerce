import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hala_sat_task/core/models/product_list_models.dart';
import 'package:hala_sat_task/core/repository/product_list_repository.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

class ProductsNotifier extends PagedNotifier<int, Product> {
  ProductsNotifier()
      : super(
          load: (page, limit) =>
              ProductListRepository().geProductLitModels(page, limit),
          nextPageKeyBuilder: NextPageKeyBuilderDefault.mysqlPagination,
        );
  final ProductListRepository productListRepository = ProductListRepository();
}

final productsProvider =
    StateNotifierProvider<ProductsNotifier, PagedState<int, Product>>(
        (_) => ProductsNotifier());
