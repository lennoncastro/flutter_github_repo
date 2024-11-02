import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class UrlBaseInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.baseUrl = 'https://api.github.com';
    handler.next(options);
  }
}
