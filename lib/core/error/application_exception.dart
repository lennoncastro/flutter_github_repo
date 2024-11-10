sealed class ApplicationException implements Exception {}

class UnknownError extends ApplicationException {}

class RequestError extends ApplicationException {
  RequestError(this.statusCode, this.statusMessage);

  final int statusCode;
  final String statusMessage;
}

class ServerError extends ApplicationException {}

class NoInternetException extends ApplicationException {}
