import 'dart:io';
import 'package:dio/dio.dart';
import 'package:eko_assignment/main.dart';
import 'package:eko_assignment/services/rest_services/api_service_system_models/error_model.dart';
import 'package:eko_assignment/services/rest_services/api_service_system_models/error_short_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_exception.freezed.dart';

@freezed
class NetworkException with _$NetworkException {
  const factory NetworkException.requestCancelled() = RequestCancelled;

  const factory NetworkException.unauthorizedRequest(String reason) = UnauthorizedRequest;

  const factory NetworkException.badRequest() = BadRequest;

  const factory NetworkException.notFound(String reason) = NotFound;

  const factory NetworkException.methodNotAllowed() = MethodNotAllowed;

  const factory NetworkException.notAcceptable() = NotAcceptable;

  const factory NetworkException.requestTimeout() = RequestTimeout;

  const factory NetworkException.sendTimeout() = SendTimeout;

  const factory NetworkException.conflict() = Conflict;

  const factory NetworkException.internalServerError() = InternalServerError;

  const factory NetworkException.notImplemented() = NotImplemented;

  const factory NetworkException.serviceUnavailable() = ServiceUnavailable;

  const factory NetworkException.noInternetConnection() = NoInternetConnection;

  const factory NetworkException.formatException() = FormatException;

  const factory NetworkException.unableToProcess() = UnableToProcess;

  const factory NetworkException.defaultError(String error) = DefaultError;

  const factory NetworkException.unexpectedError() = UnexpectedError;

  static NetworkException handleResponse(Response<dynamic>? response) {
    String? msg;
    try {
      msg = ErrorModel.fromJson(response?.data as Map<String, dynamic>).detail?.first.msg;
    } catch (e, stackTrace) {
      appLogger.e('$e\n stackTrace : $stackTrace');
    }
    try {
      msg = ErrorShortModel.fromJson(response?.data as Map<String, dynamic>).detail;
    } catch (e, stackTrace) {
      appLogger.e('$e\n stackTrace : $stackTrace');
    }

    switch (response?.statusCode ?? 0) {
      case 400:
      case 401:
        return NetworkException.unauthorizedRequest(msg ?? 'network_unauthorizedRequest');
      case 403:
        return NetworkException.unauthorizedRequest(msg ?? 'network_forbidden_request');
      case 404:
        return NetworkException.notFound(msg ?? 'network_not_found');
      case 409:
        return const NetworkException.conflict();
      case 408:
        return const NetworkException.requestTimeout();
      case 500:
        return const NetworkException.internalServerError();
      case 503:
        return const NetworkException.serviceUnavailable();
      default:
        return NetworkException.defaultError(msg ?? 'network_error');
    }
  }

  static NetworkException getDioException(dynamic error) {
    if (error is Exception) {
      try {
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              return const NetworkException.requestCancelled();
            case DioExceptionType.connectionTimeout:
              return const NetworkException.requestTimeout();
            case DioExceptionType.connectionError:
              return const NetworkException.noInternetConnection();
            case DioExceptionType.receiveTimeout:
            case DioExceptionType.sendTimeout:
              return const NetworkException.sendTimeout();
            case DioExceptionType.badResponse:
              return NetworkException.handleResponse(error.response);
            case DioExceptionType.unknown:
            case DioExceptionType.badCertificate:
              return const NetworkException.unexpectedError();
          }
        } else if (error is SocketException) {
          return const NetworkException.noInternetConnection();
        } else {
          return const NetworkException.unexpectedError();
        }
      } on FormatException {
        return const NetworkException.formatException();
      } on Exception {
        return const NetworkException.unexpectedError();
      }
    } else {
      return error.toString().contains('is not a subtype of')
          ? const NetworkException.unableToProcess()
          : const NetworkException.unexpectedError();
    }
  }

  static String getErrorMessage(NetworkException networkException) => networkException.when(
        notImplemented: () => 'Not Implemented',
        requestCancelled: () => 'Request Cancelled',
        internalServerError: () => 'Internal Server Error',
        notFound: (reason) => reason,
        serviceUnavailable: () => 'Service unavailable',
        methodNotAllowed: () => 'Method Allowed',
        badRequest: () => 'Bad request',
        unauthorizedRequest: (error) => error,
        unexpectedError: () => 'Unexpected error occurred',
        requestTimeout: () => 'Connection request timeout',
        noInternetConnection: () => 'No internet connection',
        conflict: () => 'Error due to a conflict',
        sendTimeout: () => 'Send timeout in connection with API server',
        unableToProcess: () => 'Unable to process the data',
        defaultError: (error) => error,
        formatException: () => 'Unexpected error occurred',
        notAcceptable: () => 'Not acceptable',
      );
}
