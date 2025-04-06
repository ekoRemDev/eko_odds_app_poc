import 'package:eko_assignment/services/rest_services/i_api_config.dart';

class ChainsApiConfig extends IApiConfig {
  ChainsApiConfig({
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
