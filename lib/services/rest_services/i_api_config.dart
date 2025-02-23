abstract class IApiConfig {
  IApiConfig(
    this.receiveTimeout,
    this.connectTimeout,
    this.sendTimeout,
    this.apiBaseUrl,
  );

  int receiveTimeout;
  int connectTimeout;
  int sendTimeout;
  String apiBaseUrl;

  String get baseUrl => apiBaseUrl;
}
