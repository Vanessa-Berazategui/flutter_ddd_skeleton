import 'package:dartz/dartz.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/shared/domain/error/failure.dart';

// ignore: one_member_abstracts
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}
