import '../../constance/end_poins.dart';
import '../../network/dio_client.dart';

class ProductListServices {
  ProductListServices();
  final DioClient dio = DioClient();

  Future productListResponse(int page, int limit) async {
    try {
      final response = await dio.get(Endpoints.products,
          queryParameters: {"page": page, "limit": limit});
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
