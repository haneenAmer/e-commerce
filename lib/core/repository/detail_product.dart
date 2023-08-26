import 'package:hala_sat_task/core/models/detail_product.dart';

import '../services/detail_product.dart';

class DetailProductRepository {
  final String id;
  DetailProductRepository(this.id);

  Future<DetailProduct> getDetailProductModel() async {
    DetailProductServices detailProductServices = DetailProductServices(
        'https://rrs-app-zcfos.ondigitalocean.app/meals', id);

    try {
      final json = await detailProductServices.detailProducResponse();
      DetailProduct detailProduct = DetailProduct.fromJson(json);
      //print(" i am here 2${detailProduct}");
      return detailProduct;
    } catch (e) {
      rethrow;
    }
  }
}
