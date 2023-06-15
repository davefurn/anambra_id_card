import 'package:acmc/src/constants/colors.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowFlushBar {
  static Future<void> showError({
    required BuildContext context,
    int duration = 1,
    String? error,
  }) async {
    final flushBar = Flushbar(
      backgroundColor: IdColors.backgroundColour,
      borderColor: const Color(0xffEF4444),
      borderRadius: BorderRadius.circular(6.r),
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      messageText: Text(
        error ?? 'Something went wrong, Check your internet connection',
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Color(0xffEF4444),
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
      backgroundColor: IdColors.backgroundColour,
      borderColor: const Color(0xff1DCD24),
      borderRadius: BorderRadius.circular(6.r),
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      messageText: Text(
        message ?? 'Successful',
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Color(0xff1DCD24),
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
