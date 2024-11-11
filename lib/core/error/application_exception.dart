import 'package:freezed_annotation/freezed_annotation.dart';

part 'application_exception.freezed.dart';

@freezed
class ApplicationException with _$ApplicationException implements Exception {
  const factory ApplicationException.unknown() = UnknownError;

  const factory ApplicationException.noInternetException() =
      NoInternetException;

  const factory ApplicationException.serverError() = ServerError;

  const factory ApplicationException.requestError(
    int statusCode,
    final String statusMessage,
  ) = RequestError;
}
