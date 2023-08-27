import '../../constance/end_poins.dart';
import '../../network/dio_client.dart';

class DetailProductServices {
  final int id;

  DetailProductServices(this.id);
  DioClient dio = DioClient();

  Future detailProducResponse() async {
    try {
      final response = await dio.get('${Endpoints.products}/$id');
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
