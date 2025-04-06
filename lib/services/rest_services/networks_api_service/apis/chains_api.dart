import 'package:dio/dio.dart';
import 'package:eko_assignment/services/rest_services/networks_api_service/chains_api_service.dart';

class ChainsApi {
  final ChainsApiService chainsApiService = ChainsApiService();

  Future<Response<dynamic>> getChains() async => chainsApiService.get(
        path: 'chains',
      );
}
