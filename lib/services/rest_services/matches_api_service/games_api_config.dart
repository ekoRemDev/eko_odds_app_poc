import 'package:eko_assignment/services/rest_services/i_api_config.dart';

class GamesApiConfig extends IApiConfig {
  GamesApiConfig({
    int? receiveTimeout,
    int? connectTimeout,
    int? sendTimeout,
    String? apiBaseUrl,
  }) : super(
          receiveTimeout ?? 15000,
          connectTimeout ?? 15000,
          sendTimeout ?? 15000,
          apiBaseUrl ?? '',
        );
}
