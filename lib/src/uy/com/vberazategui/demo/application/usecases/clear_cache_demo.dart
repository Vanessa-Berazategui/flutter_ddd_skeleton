import 'package:dartz/dartz.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/demo/domain/repositories/demo_repository.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/shared/application/usecases/usecase.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/shared/domain/error/failure.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ClearCacheDemo implements UseCase<Unit, NoParams> {
  ClearCacheDemo({required this.repository});

  final DemoRepository repository;

  @override
  Future<Either<Failure, Unit>> call(NoParams params) async {
    return repository.clearCacheDemo();
  }
}
