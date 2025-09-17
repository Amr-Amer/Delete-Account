import 'package:dartz/dartz.dart';
import 'package:delete_account_page/core/error/error.dart';
import 'package:delete_account_page/core/error/failures.dart';
import 'package:delete_account_page/home/data/data_sources/home_remote_data_source.dart';
import 'package:delete_account_page/home/domain/repository/home_repository.dart';

class HomeRepoImp implements HomeRepository {

  final HomeRemoteDataSource _homeRemoteDataSource;

  HomeRepoImp(this._homeRemoteDataSource);

  @override
  Future<Either<Failure, void>> deleteAccount({required String uId}) async{
    try {
      await _homeRemoteDataSource.deleteAccount(uId: uId);
      return Right(null);
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    } catch (e) {
      return Left(AuthFailure('An unexpected error occurred'));
    }
  }
}