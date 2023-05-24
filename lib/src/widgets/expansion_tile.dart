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
import 'package:acmc/src/constants/colors.dart';
import 'package:acmc/src/utils/extension/widget_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Expansion1 extends StatelessWidget {
  final String mainText;
  final IconData icon;
  final List<Widget> widgets;
  const Expansion1({
    Key? key,
    required this.mainText,
    required this.icon,
    required this.widgets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Color(0xffBCC2CC))),
      collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Color(0xffBCC2CC))),
      childrenPadding: EdgeInsets.only(left: 20.w),
      expandedAlignment: Alignment.topLeft,
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      title: Row(
        children: [
          Icon(
            icon,
            color: IdColors.mainColor,
            size: 18,
          ),
          11.sbW,
          Text(
            mainText,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: IdColors.textColorBlack,
                ),
          ),
        ],
      ),
      children: widgets,
    );
  }
}
