import 'package:dio/dio.dart';

class DioProvider{
  static late Dio _dio;

  static init(){
    _dio = Dio(BaseOptions(
      baseUrl: "https://jsonplaceholder.typicode.com"
    ));
  }

  Future<Response> get(
      {required String endpoint,
      Map<String, dynamic>? params,
      Map<String, dynamic>? headers}) async {
    return await _dio.get(
      endpoint,
      data: params,
      options: Options(headers: headers),
    );
  }

  Future<Response> post(
      {required String endpoint,
      Map<String, dynamic>? params,
      Map<String, dynamic>? headers}) async {
    return await _dio.get(
      endpoint,
      data: params,
      options: Options(headers: headers),
    );
  }

  Future<Response> update(
      {required String endpoint,
      Map<String, dynamic>? params,
      Map<String, dynamic>? headers}) async {
    return await _dio.get(
      endpoint,
      data: params,
      options: Options(headers: headers),
    );
  }

  Future<Response> delete(
      {required String endpoint,
      Map<String, dynamic>? params,
      Map<String, dynamic>? headers}) async {
    return await _dio.get(
      endpoint,
      data: params,
      options: Options(headers: headers),
    );
  }
}