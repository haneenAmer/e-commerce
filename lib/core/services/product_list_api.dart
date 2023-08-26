import 'package:dio/dio.dart';

class ProductListServices {
  final String endPoint;

  ProductListServices(this.endPoint);
  final Dio dio = Dio();

  Future productListResponse() async {
    try {
      final response = await dio.get(endPoint);
      print(response.data);
      print('hi from server');
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
