import 'package:delete_account_page/home/data/data_sources/home_remote_data_source.dart';
import 'package:delete_account_page/home/data/data_sources/home_remote_data_source_imp.dart';
import 'package:delete_account_page/home/data/repository/home_repo_imp.dart';
import 'package:delete_account_page/home/domain/repository/home_repository.dart';
import 'package:delete_account_page/home/domain/usecases/delete_account_usecase.dart';
import 'package:delete_account_page/home/presentation/controller/home_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeBindings extends Bindings {

  @override
  void dependencies() {
    //TODO ✅ Remote DataSource
    Get.lazyPut<HomeRemoteDataSource>(
          () => HomeRemoteDataSourceImp(FirebaseAuth.instance, FirebaseFirestore.instance),
    );

    //TODO ✅ Repository
    Get.lazyPut<HomeRepository>(
          () => HomeRepoImp(Get.find<HomeRemoteDataSource>()),
    );

    //TODO ✅ UseCase
    Get.lazyPut<DeleteAccountUseCase>(
          () => DeleteAccountUseCase(Get.find<HomeRepository>()),
    );

    //TODO ✅ Controller
    Get.put<HomeController>(
      HomeController(deleteAccountUseCase: Get.find<DeleteAccountUseCase>()),
    );
  }
}
