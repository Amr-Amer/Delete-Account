import 'package:delete_account_page/firebase_options.dart';
import 'package:delete_account_page/home/presentation/controller/home_bindings.dart';
import 'package:delete_account_page/home/presentation/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1440, 1024),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            initialBinding: HomeBindings(),
            title: 'Delete Account',
            theme: ThemeData(
              primaryColor: Colors.teal,
              scaffoldBackgroundColor: Colors.white,
              textTheme: GoogleFonts.tajawalTextTheme(),
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.teal,
              ),
            ),
            home: HomePage()
        );
      },
    );
  }
}
