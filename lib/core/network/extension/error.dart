import 'package:dio/dio.dart';
import 'package:github_repos/core/network/extension/response.dart';

extension DioExceptionX on DioException {
  Map<String, dynamic> get asMap => <String, dynamic>{
        'message': message,
        'response': response?.asMap,
        'stackTrace': stackTrace.toString(),
      };
}
