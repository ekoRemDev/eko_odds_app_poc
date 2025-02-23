import 'package:dio/dio.dart';

abstract class IApiService<T> {
  Future<Response<T>>? get({
    required String path,
    String? queryParams,
  });
}
