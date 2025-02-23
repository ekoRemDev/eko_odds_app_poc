import 'package:dio/dio.dart';
import 'package:eko_assignment/services/rest_services/matches_api_service/games_api_service.dart';

class GamesApi {
  final GamesApiService matchesApiService = GamesApiService();

  Future<Response<dynamic>> getGames() async => matchesApiService.get(
        path: 'games',
      );
}
