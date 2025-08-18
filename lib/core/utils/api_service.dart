import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  ApiService(this.dio);
  Future<Map<String, dynamic>> getservice({required String endpoint}) async {
    var response =
        await dio.get('https://www.googleapis.com/books/v1/$endpoint');
    return response.data;
  }
}
