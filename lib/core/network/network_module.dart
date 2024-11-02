import 'package:dio/dio.dart';
import 'package:github_repos/core/network/interceptors/src.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  final interceptors = List.from([
    UrlBaseInterceptor(),
    RequestLogInterceptor(),
  ]);

  @lazySingleton
  Dio get dio {
    return Dio()..interceptors.addAll(Iterable.castFrom(interceptors));
  }
}
