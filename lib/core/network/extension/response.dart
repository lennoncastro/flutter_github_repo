import 'package:dio/dio.dart';

extension ResponseX on Response<dynamic> {
  Map<String, dynamic> get asMap => <String, dynamic>{
        'data': data,
        'statusCode': statusCode,
        'statusMessage': statusMessage,
      };
}
