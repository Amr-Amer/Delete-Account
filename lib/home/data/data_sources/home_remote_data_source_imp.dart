import 'package:delete_account_page/core/constants/firebase_constants.dart';
import 'package:delete_account_page/core/error/error.dart';
import 'package:delete_account_page/home/data/data_sources/home_remote_data_source.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class HomeRemoteDataSourceImp implements HomeRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  HomeRemoteDataSourceImp(this.firebaseAuth, this.firestore);

  @override
  Future<void> deleteAccount({required String uId}) async {
    try {
      final user = firebaseAuth.currentUser;

      if (user == null) {
        throw AuthException("❌ No user is currently signed in");
      }

      if (user.uid != uId) {
        throw AuthException("❌ UID mismatch, unauthorized delete");
      }

      // 1️⃣ حذف بيانات المستخدم من Firestore
      await firestore.collection(FirebaseConstants.usersCollection).doc(uId).delete();

      // 2️⃣ حذف حساب المستخدم من Firebase Auth
      await user.delete();

      if (kDebugMode) {
        print("✅ User deleted successfully (Auth + Firestore)");
      }
    } catch (e) {
      throw AuthException("❌ Failed to delete account: $e");
    }
  }
}
