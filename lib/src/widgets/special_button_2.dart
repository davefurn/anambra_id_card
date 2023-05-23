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

import '../constants/colors.dart';
import '../extension/size_config.dart';

class SpecialButton2 extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final Color? selectedTextColor;
  final Widget? icon;
  final double? height;
  const SpecialButton2(
      {Key? key,
      required this.text,
      this.backgroundColor,
      this.borderColor,
      this.textColor,
      this.selectedTextColor,
      this.icon,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? IdColors.subColor),
          color: backgroundColor ?? IdColors.backgroundColour,
          borderRadius: BorderRadius.circular(8)),
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(12),
          vertical: getProportionateScreenHeight(7)),
      // alignment: Alignment.center,
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
                  fontSize: 14,
                  color: textColor ??
                      selectedTextColor ??
                      IdColors.textColorGrey,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }
}
