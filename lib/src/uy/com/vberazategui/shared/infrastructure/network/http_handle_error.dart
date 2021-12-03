import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/shared/domain/error/failure.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class HttpHandleError {
  Failure getFailure(DioError e) {
    switch (e.type) {

      /// When opening url timeout, it occurs.
      case DioErrorType.connectTimeout:
        return ConnectTimeOutFailure();

      /// It occurs when receiving timeout.
      case DioErrorType.receiveTimeout:
        return ReceiveTimeOutFailure();

      /// When the server response,
      /// but with a incorrect status, such as 404, 503...
      case DioErrorType.response:
        Map<String, dynamic> parsedJson;
        e.response != null
            ? parsedJson = json.decode(utf8.decode(e.response!.data))
            : parsedJson = {};
        return ServerFailure(parsedJson['message']);

      /// Default error type, Some other Error. In this case, you can
      /// read the DioError.error if it is not null.
      // case DioErrorType.DEFAULT:
      default:
        return NoInternetFailure();
    }
  }
}
