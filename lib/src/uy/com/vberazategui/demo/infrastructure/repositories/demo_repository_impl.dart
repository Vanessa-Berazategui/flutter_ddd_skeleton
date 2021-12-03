import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/demo/domain/entities/demo.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/demo/domain/repositories/demo_repository.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/demo/infrastructure/datasources/demo_local_data_source.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/demo/infrastructure/datasources/demo_remote_data_source.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/demo/infrastructure/dtos/demo_dto.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/shared/domain/error/failure.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/shared/infrastructure/network/http_handle_error.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@LazySingleton(as: DemoRepository)
class DemoRepositoryImpl implements DemoRepository {
  DemoRepositoryImpl({
    required this.logger,
    required this.localDataSource,
    required this.remoteDataSource,
    required this.httpHandleError,
  });

  final Logger logger;
  final DemoLocalDataSource localDataSource;
  final DemoRemoteDataSource remoteDataSource;
  final HttpHandleError httpHandleError;

  @override
  Future<Either<Failure, Unit>> cacheDemo(Demo user) async {
    try {
      await localDataSource.cacheDemo(DemoDto.fromDomain(user));
      return right(unit);
    } catch (e) {
      logger.e('Oops, an unexpected error occurred... $e');
      return left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Demo>> getCachedDemo() async {
    try {
      final result = await localDataSource.getCachedDemo();
      return right(result);
    } catch (e) {
      logger.e('Oops, an unexpected error occurred... $e');
      return left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> clearCacheDemo() async {
    try {
      await localDataSource.clearCacheDemo();
      return right(unit);
    } catch (e) {
      logger.e('Oops, an unexpected error occurred... $e');
      return left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> demoMethod(String demoDetail) async {
    try {
      await remoteDataSource.demoMethod(demoDetail);
      return right(unit);
    } catch (e) {
      logger.e('Oops, an unexpected error occurred... $e');
      return left(httpHandleError.getFailure(e as DioError));
    }
  }
}
