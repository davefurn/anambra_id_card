import 'package:acmc/src/constants/colors.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowFlushBar {
  static Future<void> showError({
    required BuildContext context,
    int duration = 3,
    String? error,
  }) async {
    final flushBar = Flushbar(
      backgroundColor: Colors.red.withOpacity(0.8),
      borderColor: Colors.red,
      borderRadius: BorderRadius.circular(8.r),
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      messageText: Text(
        error ?? 'Something went wrong, Check your internet connection',
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: IdColors.backgroundColour,
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
      ),
      positionOffset: kBottomNavigationBarHeight.h,
      duration: Duration(seconds: duration),
    );
    await flushBar.show(context);
  }

  static Future<void> showSuccess(
      {String? message,
      required BuildContext context,
      Duration? duration,
      Function()? perform}) async {
    final flushBar = Flushbar(
      backgroundColor: Colors.green.withOpacity(0.8),
      borderColor: Colors.green,
      borderRadius: BorderRadius.circular(8.r),
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      messageText: Text(
        message ?? 'Successful',
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: IdColors.backgroundColour,
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
      ),
      positionOffset: kBottomNavigationBarHeight.h,
      duration: duration ?? const Duration(seconds: 3),
    );
    await flushBar.show(context);
    if (perform != null) {
      perform();
    }
  }
}
