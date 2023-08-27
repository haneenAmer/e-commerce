import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:hala_sat_task/core/models/detail_product.dart';
import '../../network/dio_exeptions.dart';
import '../services/detail_product.dart';

class DetailProductRepository {
  final int id;
  DetailProductRepository(this.id);

  Future<DetailProduct> getDetailProductModel() async {
    DetailProductServices detailProductServices = DetailProductServices(id);

    try {
      final json = await detailProductServices.detailProducResponse();

      DetailProduct detailProduct = DetailProduct.fromJson(json);
      //print(" i am here 2${detailProduct}");
      return detailProduct;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      log(errorMessage.toString());
      rethrow;
    }
  }
}
