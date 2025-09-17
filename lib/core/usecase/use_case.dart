import 'package:dartz/dartz.dart';
import 'package:delete_account_page/core/error/failures.dart';

abstract class UseCase<ReturnType , Param>{
  Future<Either<Failure , ReturnType>> call(Param param);
}
abstract class UseCaseNoParams<Type> {
  Future<Either<Failure, Type>> call();
}

class NoParams {}
