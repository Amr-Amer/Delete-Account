import 'package:dartz/dartz.dart';
import 'package:delete_account_page/core/error/failures.dart';

abstract class HomeRepository {

  Future<Either<Failure, void>> deleteAccount({required String uId});

}