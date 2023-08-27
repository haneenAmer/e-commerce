import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:hala_sat_task/core/models/product_list_models.dart';
import '../../network/dio_exeptions.dart';
import '../services/product_list_api.dart';

class ProductListRepository {
  ProductListRepository();

  ProductListServices productListServices = ProductListServices();

  Future<List<Product>> geProductLitModels(int page, int limit) async {
    try {
      var json = await productListServices.productListResponse(page, limit);
      List<Product> products = Products.fromJson(json).data;
      return products;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      log(errorMessage.toString());
      rethrow;
    }
  }
}
