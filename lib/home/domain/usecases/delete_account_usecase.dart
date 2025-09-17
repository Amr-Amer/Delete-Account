import 'package:dartz/dartz.dart';
import 'package:delete_account_page/core/error/failures.dart';
import 'package:delete_account_page/core/usecase/use_case.dart';
import 'package:delete_account_page/home/domain/repository/home_repository.dart';

class DeleteAccountUseCase extends UseCase<void, String>{

  final HomeRepository homeRepository;

  DeleteAccountUseCase(this.homeRepository);

  @override
  Future<Either<Failure, void>> call(String uId) {
    return homeRepository.deleteAccount(uId: uId);
  }
}