import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:eko_assignment/main.dart';
import 'package:eko_assignment/services/rest_services/api_service_system_models/failure.dart';
import 'package:eko_assignment/services/rest_services/api_service_system_models/network_exception.dart';
import 'package:eko_assignment/services/rest_services/matches_api_service/apis/games_api.dart';
import 'package:eko_assignment/services/rest_services/matches_api_service/models/games_list.dart';

class GamesApiHelper {
  Future<Either<Failure, GamesList>> gameList() async => _handleRequest(
        () => GamesApi().getGames(),
        GamesList.fromJson,
      );

  Future<Either<Failure, T>> _handleRequest<T>(
    Future<Response<dynamic>> Function() request,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    try {
      final response = await request();
      if (response.data != null && (response.data is List || response.data is Map) && response.data.isNotEmpty) {
        return Right(fromJson({'games': response.data}));
      } else {
        return Left(NetworkFailure(const NetworkException.unexpectedError()));
      }
    } on DioException catch (e) {
      return Left(NetworkFailure(NetworkException.getDioException(e)));
    } catch (e, stackTrace) {
      appLogger.e('🐞Error: ${e.toString()}\n stackTrace : $stackTrace');
      return Left(NetworkFailure(const NetworkException.unexpectedError()));
    }
  }
}
