import 'package:dio/dio.dart';
import 'package:github_repos/core/network/extension/error.dart';
import 'package:github_repos/core/network/extension/request_options.dart';
import 'package:github_repos/core/network/extension/response.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@injectable
class RequestLogInterceptor extends InterceptorsWrapper {
  final _logger = Logger();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    _logger.d('Request: ${options.asMap}');
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    _logger.d(response.asMap);
    handler.next(response);
  }

  @override
  void onError(
    DioException error,
    ErrorInterceptorHandler handler,
  ) {
    _logger.d(error.asMap);
    handler.next(error);
  }
}
