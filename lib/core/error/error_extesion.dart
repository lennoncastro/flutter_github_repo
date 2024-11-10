import 'package:dio/dio.dart';
import 'package:github_repos/core/error/src.dart';

extension DioExceptionX on DioException {
  ApplicationException get asApplicationException {
    if (error is NoInternetException) {
      return NoInternetException();
    }
    if (type != DioExceptionType.badResponse || response == null) {
      return UnknownError();
    }
    final statusCode = response?.statusCode ?? 500;
    final statusMessage = response!.statusMessage ?? '';
    if (statusCode >= 500) {
      return ServerError();
    }
    return RequestError(statusCode, statusMessage);
  }
}
