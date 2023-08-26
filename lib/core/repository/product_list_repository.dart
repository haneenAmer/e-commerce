import 'package:hala_sat_task/core/models/product_list_models.dart';
import '../services/product_list_api.dart';

class ProductListRepository {
  ProductListRepository();

  ProductListServices productListServices =
      ProductListServices('https://dummyjson.com/products');

  Future<Products> geProductLitModels() async {
    try {
      var json = await productListServices.productListResponse();
      Products products = Products.fromJson(json);
      print('hi from repo');
      return products;
    } catch (e) {
      rethrow;
    }
  }
}
