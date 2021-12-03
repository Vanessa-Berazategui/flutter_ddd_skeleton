import 'package:dartz/dartz.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/demo/domain/repositories/demo_repository.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/shared/application/usecases/usecase.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/shared/domain/error/failure.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class Demo implements UseCase<Unit, Params> {
  Demo({required this.repository});

  final DemoRepository repository;

  @override
  Future<Either<Failure, Unit>> call(Params params) async {
    return repository.demoMethod(params.demoDetail);
  }
}

class Params {
  Params({required this.demoDetail});

  final String demoDetail;
}
