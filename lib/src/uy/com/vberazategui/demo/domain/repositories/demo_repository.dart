import 'package:dartz/dartz.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/demo/domain/entities/demo.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/shared/domain/error/failure.dart';

abstract class DemoRepository {
  Future<Either<Failure, Unit>> cacheDemo(Demo demo);
  Future<Either<Failure, Demo>> getCachedDemo();
  Future<Either<Failure, Unit>> clearCacheDemo();
  Future<Either<Failure, Unit>> demoMethod(String demoDetail);
}
