import 'package:dio/dio.dart';
import 'package:github_repos/core/error/src.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

@injectable
class InternetConnectionInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    bool hasInternetAccess = await InternetConnection().hasInternetAccess;
    if (!hasInternetAccess) {
      handler.reject(
        DioException(
          requestOptions: options,
          error: NoInternetException(),
        ),
      );
      return;
    }
    handler.next(options);
  }
}
