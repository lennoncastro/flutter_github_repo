import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:github_repos/core/network/interceptors/dio_cache_interceptor_options.dart';
import 'package:github_repos/core/network/interceptors/src.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  final interceptors = List.from([
    InternetConnectionInterceptor(),
    DioCacheInterceptor(options: dioCacheOptions),
    UrlBaseInterceptor(),
    RequestLogInterceptor(),
  ]);

  @lazySingleton
  Dio get dio {
    return Dio()..interceptors.addAll(Iterable.castFrom(interceptors));
  }
}
