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
import 'package:flutter/material.dart';

import '../../../extension/size_config.dart';

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
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: hpD ?? getProportionateScreenWidth(20),
      ),
      child: ElevatedButton(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          side: BorderSide(
            color: borderColor ?? IdColors.mainColor,
          ),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: fontSize,
                color: IdColors.textColorBlack,
                fontWeight: fontWeight,
              ),
        ),
      ),
    );
  }
}
