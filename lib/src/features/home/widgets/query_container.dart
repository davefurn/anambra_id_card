// Copyright 2023 Davefurn
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:acmc/src/utils/extension/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/colors.dart';

class QueryContainer extends StatelessWidget {
  final List<Color> colors;
  final String svgAsset;
  final String svgAssetText;
  final String description;
  final double? width;
  final double? height;
  const QueryContainer({
    Key? key,
    required this.colors,
    required this.svgAsset,
    required this.svgAssetText,
    required this.description,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          end: Alignment.bottomCenter,
          begin: Alignment.topCenter,
          colors: colors,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            svgAsset,
            color: IdColors.backgroundColour,
            width: 40.w,
            height: 40.h,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            svgAssetText,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
              color: IdColors.backgroundColour,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 4.h,
          ),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 16.w),
          //   child: Text(
          //     description,
          //     style: Theme.of(context).textTheme.headlineLarge!.copyWith(
          //           fontWeight: FontWeight.w500,
          //           fontSize: 12,
          //           color: IdColors.backgroundColour,
          //         ),
          //     textAlign: TextAlign.center,
          //   ),
          // ),
        ],
      ),
    );
  }
}

class ActionContainer extends StatelessWidget {
  final String svg;
  final String text;
  final List<Color> colors;
  final void Function()? onTap;
  const ActionContainer({
    super.key,
    required this.colors,
    required this.svg,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Colors.white,
          border: Border.all(
            color: const Color(0xffE2E6EB),
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 15,
              spreadRadius: 0,
              color: Colors.black.withOpacity(0.1),
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 54.r,
              width: 54.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: colors,
                ),
              ),
              child: SvgPicture.asset(
                'assets/svgs/$svg.svg',
                fit: BoxFit.scaleDown,
              ),
            ),
            8.sbH,
            FittedBox(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1,
                  fontWeight: FontWeight.w600,
                  fontSize: 10.sp,
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
