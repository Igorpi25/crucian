import 'package:crucian/application/boundary/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Input, Output> {
  Future<Either<Failure, Output>> execute(Input input);
}