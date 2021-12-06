import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/shared/infrastructure/error/exceptions.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:injectable/injectable.dart';

// ignore: one_member_abstracts
abstract class DemoRemoteDataSource {
  Future<void> demoMethod(String demoDetail);
}

@LazySingleton(as: DemoRemoteDataSource)
class DemoRemoteDataSourceImpl implements DemoRemoteDataSource {
  DemoRemoteDataSourceImpl({required this.client});

  final Dio client;
  final _demoUrl = GlobalConfiguration().get('demo_url');

  @override
  Future<void> demoMethod(String demoDetail) async {
    final url = '$_demoUrl'
        .replaceFirst('{demoDetail}', Uri.encodeComponent(demoDetail));

    final response = await client.post(url);

    final parsedJson =
        response.data.isEmpty ? null : json.decode(utf8.decode(response.data));

    if (response.statusCode != 200) {
      if (parsedJson != null) {
        throw ServerException(parsedJson['message']);
      } else {
        throw ServerException('No hay iformación con los datos ingresados');
      }
    }
  }
}
