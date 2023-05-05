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
import 'package:acmc/src/extension/size_config.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String text;
  final double? pDtop;
  final double? pDleft;
  final double? pDright;
  final double? width;
  final double? height;
  final double? fontSize;
  final TextAlign? textAlign;
  const TitleWidget({
    super.key,
    required this.text,
    this.pDtop,
    this.pDleft,
    this.pDright,
    this.width,
    this.height,
    this.textAlign,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.only(
        top: pDtop ?? getProportionateScreenHeight(61),
        left: pDleft ?? getProportionateScreenWidth(102),
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: SizedBox(
          width: width ?? getProportionateScreenWidth(181),
          height: height ?? getProportionateScreenHeight(36),
          child: Text(
            textAlign: textAlign ?? TextAlign.start,
            text,
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(fontSize: fontSize ?? 28),
                maxLines: 1,
          ),
        ),
      ),
    );
  }
}
