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
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';

class SpecialButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final double width;
  final double height;
  final double iconSize;
  final Color iconColor;
  final Color borderColor;
  const SpecialButton({
    Key? key,
    required this.icon,
    required this.text,
    this.width = 96,
    this.height = 32,
    this.iconSize = 18,
    this.iconColor = IdColors.textColorBlack,  this.borderColor =  const Color(0xffDFE5DF),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h ,
      width: width.w,
      decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          color: IdColors.backgroundColour,
          borderRadius: BorderRadius.circular(6)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: iconSize,
            color: IdColors.textColorBlack,
          ),
          SizedBox(
            width: 4.w,
          ),
          Text(text,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 14,
                    color: iconColor,
                    fontWeight: FontWeight.w500,
                  )),
        ],
      ),
    );
  }
}
