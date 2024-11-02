import 'package:dio/dio.dart';

extension RequestOptionsX on RequestOptions {
  Map<String, dynamic> get asMap => <String, dynamic>{
        'method': method,
        'path': path,
        'queryParameters': queryParameters,
        'data': data,
        'headers': headers,
      };
}
