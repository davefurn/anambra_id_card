import 'dart:convert';

import 'package:acmc/src/services/post_requests.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QRCodeWidget extends StatefulWidget {
  final String employeeId;
  final double? height;
  final double? width;
  const QRCodeWidget({
    super.key,
    required this.employeeId,
    this.height,
    this.width,
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
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else {
          if (snapshot.hasData && snapshot.data != null) {
            var base64 =
                (snapshot.data!.data['data']['qr_code_image'] as String)
                    .substring(22);
            return Container(
              height: widget.height ?? 210.h,
              width: widget.width ?? 207.w,
              margin: EdgeInsets.symmetric(horizontal: 64.w),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: MemoryImage(
                    base64Decode(base64),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            );
          } else {
            return const Text('Error');
          }
        }
      },
    );
  }
}
