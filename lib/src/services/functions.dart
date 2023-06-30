import 'dart:io';

import 'package:acmc/src/features/authentication/login/login.dart';
import 'package:acmc/src/router/app_routes.dart';
import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path_provider/path_provider.dart';

class GlobalFunctions {
  static Future<String> downloadPath() async {
    late String path;
    if (Platform.isAndroid) {
      path = await ExternalPath.getExternalStoragePublicDirectory(
          ExternalPath.DIRECTORY_DOCUMENTS);
    } else {
      path = (await getApplicationDocumentsDirectory()).path;
    }
    return path;
  }

  static expiredeSession(BuildContext context) async {
    pushToAndClearStack(context, const Login());
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        surfaceTintColor: Colors.white,
        contentPadding: EdgeInsets.all(20.r),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        title: SvgPicture.asset(
          'assets/svgs/info_big.svg',
          color: const Color(0xff0E5CE3),
          width: 34.r,
          height: 34.r,
        ),
        children: [
          Center(
            child: Text(
              'Your session has expired',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
