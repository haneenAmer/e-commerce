import 'package:dio/dio.dart';

class DetailProductServices {
  final String endpoint;
  final String id;

  DetailProductServices(this.endpoint, this.id);
  Dio dio = Dio();

  Future detailProducResponse() async {
    try {
      final response = await dio.get(endpoint, queryParameters: {'id': id});
      print("i am here ${response.data}");
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
