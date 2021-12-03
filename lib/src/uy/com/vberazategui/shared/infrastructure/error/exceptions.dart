import 'package:dio/dio.dart';

class ServerException extends DioError {
  ServerException(this.message)
      : super(
          error: message,
          type: DioErrorType.response,
          requestOptions: RequestOptions(path: 'path'),
        );

  @override
  final String message;

  @override
  String toString() => message;
}

class CacheException implements Exception {}
