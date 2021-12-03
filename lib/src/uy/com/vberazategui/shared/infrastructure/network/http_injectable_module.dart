import 'package:dio/dio.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:injectable/injectable.dart';

@module
abstract class HttpInjectableModule {
  @injectable
  Dio get client {
    final client = Dio(
      BaseOptions(
        // It occurs when url is opened timeout.
        connectTimeout: GlobalConfiguration().get('read_timeout'),
        contentType: 'application/json; charset=utf-8',
        responseType: ResponseType.bytes,
        baseUrl: GlobalConfiguration().get('backend_base_url'),
      ),
    );

    return client;
  }
}
