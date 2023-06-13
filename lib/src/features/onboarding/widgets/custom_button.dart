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

import 'package:acmc/src/constants/colors.dart';
import 'package:acmc/src/utils/extension/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final FontWeight fontWeight;
  final double fontSize;
  final double? hpD;
  final String text;
  final VoidCallback onpressed;
  final Color? color;
  final Color? textcolor;
  final Color? borderColor;
  final double thickLine;
  final Widget? icon;
  final bool disable;
  const CustomButton({
    super.key,
    this.hpD,
    required this.text,
    required this.onpressed,
    this.color,
    this.textcolor,
    required this.thickLine,
    this.borderColor,
    this.fontWeight = FontWeight.w600,
    this.fontSize = 16,
    this.icon,
    this.disable = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hpD ?? 20.w),
      child: ElevatedButton(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: disable ? Colors.grey : color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.r),
          ),
          side: BorderSide(
            color: disable ? Colors.grey : borderColor ?? IdColors.mainColor,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Row(
                children: [
                  icon!,
                  6.sbW,
                ],
              ),
            Text(
              text,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: fontSize,
                    color: IdColors.textColorBlack,
                    fontWeight: fontWeight,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
