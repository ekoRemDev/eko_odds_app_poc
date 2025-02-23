import 'dart:developer';

import 'package:dio/dio.dart';

class AppInterceptors extends Interceptor {
  AppInterceptors();

  Stopwatch stopWatch = Stopwatch();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    log(
        name: 'GamesApi',
        '\n'
        '${stopWatch.elapsedMilliseconds}\n'
        '--------------------------\n'
        'request - path : ${options.path}\n'
        'request - method : ${options.method}\n'
        'request - headers -: ${options.headers}\n'
        'request - data : ${options.data}\n'
        '--------------------------\n');
    stopWatch.start();
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    super.onResponse(response, handler);
    log(
        name: 'GamesApi',
        '\n'
        '${stopWatch.elapsedMilliseconds}\n'
        '--------------------------\n'
        'response.statusCode : ${response.statusCode}\n'
        '--------------------------\n'
        'response.statusMessage : ${response.statusMessage}\n'
        '--------------------------\n'
        'response.headers : ${response.headers}\n'
        '--------------------------\n'
        'response.data : ${response.data}\n');

    stopWatch.stop();
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    log(
        name: 'GamesApi',
        '\n'
        'Error occurred on API Call'
        '--------------------------\n'
        '$handler.'
        '$err'
        '${err.response?.statusCode}\n'
        '${err.type}\n'
        '--------------------------\n');

    return handler.next(err);
  }
}
