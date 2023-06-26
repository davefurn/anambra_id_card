import 'dart:convert';

import 'package:acmc/src/constants/colors.dart';
import 'package:acmc/src/services/post_requests.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class QRCodeWidget extends StatefulWidget {
  final String employeeId;
  final double? height;
  final double? width;
  final void Function(String) onLoad;
  const QRCodeWidget({
    super.key,
    required this.employeeId,
    this.height,
    this.width,
    required this.onLoad,
  });

  @override
  State<QRCodeWidget> createState() => _QRCodeWidgetState();
}

class _QRCodeWidgetState extends State<QRCodeWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: PostRequest.generateQRCode(widget.employeeId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            height: widget.height ?? 210.h,
            width: widget.width ?? 207.w,
            child: Shimmer.fromColors(
              baseColor: IdColors.mainColor,
              highlightColor: IdColors.anotherWhite,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Image.asset(
                  'assets/images/splash.png',
                  scale: 1,
                ),
              ),
            ),
          );
        } else {
          if (snapshot.hasData &&
              snapshot.data != null &&
              snapshot.data?.statusCode == 200) {
            var base64 =
                (snapshot.data!.data['data']['qr_code_image'] as String)
                    .substring(22);
            widget.onLoad(base64);
            return Container(
              height: widget.height ?? 210.h,
              width: widget.width ?? 207.w,
              margin: EdgeInsets.symmetric(horizontal: 64.w),
              child: Image.memory(
                base64Decode(base64),
                fit: BoxFit.contain,
              ),
            );
          } else {
            return Center(
              child: Text(
                snapshot.data!.data.containsKey('message')
                    ? snapshot.data!.data['message']
                    : 'Error',
              ),
            );
          }
        }
      },
    );
  }
}
