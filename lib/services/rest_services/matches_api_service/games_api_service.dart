import 'package:dio/dio.dart';
import 'package:eko_assignment/main.dart';
import 'package:eko_assignment/services/rest_services/i_api_service.dart';
import 'package:eko_assignment/services/rest_services/interceptors/api_interceptors.dart';
import 'package:eko_assignment/services/rest_services/matches_api_service/games_api_config.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class GamesApiService implements IApiService<dynamic> {
  factory GamesApiService() => _instance;

  GamesApiService._internal();

  static final _instance = GamesApiService._internal();
  final dio = _createDio();

  static Dio _createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://flask-api-294932169364.us-central1.run.app/',
        receiveTimeout: const Duration(milliseconds: 15000),
        connectTimeout: const Duration(milliseconds: 15000),
        sendTimeout: const Duration(milliseconds: 15000),
      ),
    );

    dio.interceptors.addAll({
      AppInterceptors(),
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
        filter: (options, args) => true,
      ),
    });

    return dio;
  }

  @override
  Future<Response<dynamic>> get({
    required String path,
    String? queryParams,
  }) async {
    try {
      return await dio.get(
        '${GamesApiConfig().baseUrl}$path',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );
    } on DioException catch (e) {
      if (e.response != null) {
        appLogger.i('${e.response?.statusCode}');
        if (kDebugMode) {
          appLogger.i('${e.requestOptions}\n---------${e.message}');
        }
      }
      rethrow;
    } catch (error, stackTrace) {
      appLogger.e('error is $error');
      if (!kDebugMode) {
        appLogger.e('stackTrace is ----- \n$stackTrace');
      }
      rethrow;
    }
  }
}
