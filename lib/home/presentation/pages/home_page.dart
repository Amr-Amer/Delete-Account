import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:delete_account_page/home/presentation/controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text("إعدادات الحساب"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: theme.colorScheme.onSurface,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Container(
              width: 100.w,
              height: 100.h,
              decoration: BoxDecoration(
                color: isDark ? Colors.blueGrey[800] : Colors.blueGrey[50],
                shape: BoxShape.circle,
                border: Border.all(
                  color: isDark ? Colors.blue[700]! : Colors.blue[100]!,
                  width: 2,
                ),
              ),
              child: Icon(
                Icons.person_outline,
                size: 50,
                color: isDark ? Colors.blue[200] : Colors.blueGrey,
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              "إدارة حسابك",
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              "يمكنك التحكم في بياناتك وحذف الحساب نهائياً من هنا.",
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40.h),

            // بطاقة حذف الحساب
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: isDark
                    ? Colors.red[900]!.withValues(alpha: 0.2)
                    : Colors.red[50],
                border: Border.all(
                  color: isDark
                      ? Colors.red[700]!.withValues(alpha: 0.5)
                      : Colors.red[100]!,
                  width: 1.5,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isDark
                            ? Colors.red[800]!.withValues(alpha: 0.3)
                            : Colors.red[100],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.warning_amber_rounded,
                        size: 40,
                        color: Colors.redAccent[400],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      "حذف الحساب",
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: Colors.redAccent[400],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          color: isDark ? Colors.white70 : Colors.black87,
                          fontSize: 14.sp,
                          height: 1.6.h,
                        ),
                        children: const [
                          TextSpan(
                              text: "⚠️ عند حذف الحساب، ",
                              style: TextStyle(fontWeight: FontWeight.bold)
                          ),
                          TextSpan(
                              text: "سيتم مسح جميع بياناتك بشكل دائم ولا يمكن استعادتها. "
                                  "يجب أن تكون متأكداً تماماً من قرارك."
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent[400],
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 52),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
                        elevation: 0,
                        shadowColor: Colors.transparent,
                      ),
                      icon: Icon(Icons.delete_forever, size: 22.sp),
                      label: Text(
                        "حذف الحساب نهائياً",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                      onPressed: () {
                        _showConfirmDialog(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),

            // زر رجوع
            OutlinedButton.icon(
              onPressed: () => Get.back(),
              style: OutlinedButton.styleFrom(
                foregroundColor: theme.colorScheme.onSurface,
                side: BorderSide(
                    color: theme.colorScheme.outline.withValues(alpha: 0.3)
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              icon: Icon(Icons.arrow_back, size: 20.sp),
              label: const Text("رجوع إلى الصفحة السابقة"),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void _showConfirmDialog(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    Get.dialog(
      Dialog(
        backgroundColor: isDark
            ? Colors.grey[900]
            : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.redAccent.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.warning_rounded,
                  size: 36,
                  color: Colors.redAccent[400],
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                "تأكيد حذف الحساب",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                "هل أنت متأكد أنك تريد حذف حسابك؟\n"
                    "لن تتمكن من استعادة بياناتك بعد الحذف.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.sp,
                  height: 1.5.h,
                  color: isDark ? Colors.white70 : Colors.black87,
                ),
              ),
              SizedBox(height: 28.h),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Get.back(),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.teal,
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "إلغاء",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent[400],
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      onPressed: () {
                        Get.back();
                        Get.find<HomeController>().deleteAccount();
                      },
                      child: const Text(
                        "نعم، احذف الحساب",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }
}