import 'package:acmc/src/utils/extension/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VisitorHomeCard extends StatelessWidget {
  final VoidCallback? onTap;
  final String svg;
  final String text;
  const VisitorHomeCard({
    super.key,
    this.onTap,
    required this.svg,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.r),
        margin: EdgeInsets.symmetric(horizontal: 34.w),
        decoration: BoxDecoration(
            color: const Color(0xffFFF8EB),
            border: Border.all(
              color: const Color(0xffFDB813),
            ),
            borderRadius: BorderRadius.circular(12.r)),
        child: Row(
          children: [
            Container(
              height: 60.r,
              width: 60.r,
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r)),
              child: SvgPicture.asset(
                'assets/svgs/$svg.svg',
                color: Colors.black,
              ),
            ),
            16.sbW,
            FittedBox(
              child: Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                  color: const Color(0xff363A43),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
