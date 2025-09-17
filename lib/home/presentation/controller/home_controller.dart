import 'dart:html' as html;
import 'package:delete_account_page/core/constants/firebase_constants.dart';
import 'package:get/get.dart';
import 'package:delete_account_page/core/constants/app_strings.dart';
import 'package:delete_account_page/home/domain/usecases/delete_account_usecase.dart';

class HomeController extends GetxController {
  final DeleteAccountUseCase deleteAccountUseCase;

  HomeController({required this.deleteAccountUseCase});

  RxBool isLoading = false.obs;
  late final String uid;

  @override
  void onInit() {
    super.onInit();
    final url = Uri.parse(html.window.location.href);
    uid = url.queryParameters[FirebaseConstants.uId] ?? '';
  }

  Future<void> deleteAccount() async {
    if (uid.isEmpty) {
      Get.snackbar(AppStrings.error, "User ID is missing");
      return;
    }
    isLoading.value = true;
    final result = await deleteAccountUseCase.call(uid);

    result.fold(
          (failure) => Get.snackbar(AppStrings.error, failure.message),
          (success) => Get.snackbar(AppStrings.success, AppStrings.accountDeletedSuccessfully),
    );
    isLoading.value = false;
  }
}
