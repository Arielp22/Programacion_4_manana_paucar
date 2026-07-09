// En la clase abstracta:
import 'package:dio/dio.dart';
import 'package:flutter_shop_app/core/error/api_exception.dart';
import 'package:http/http.dart' as _dio;

abstract class UserRemoteDatasource {
  // ... métodos existentes ...
  Future<Map<String, dynamic>> sendNotification({
    required String subject,
    required String message,
    int? userId,
  });
}

// En la implementación:
@override
Future<Map<String, dynamic>> sendNotification({
  required String subject,
  required String message,
  int? userId,
}) async {
  try {
    final res = await _dio.post(
      '/emails/send/',
      data: {
        'subject': subject,
        'message': message,
        if (userId != null) 'user_id': userId,
      },
    );
    return res.data as Map<String, dynamic>;
  } on DioException catch (e) {
    throw ApiException.fromDioError(e);
  }
}