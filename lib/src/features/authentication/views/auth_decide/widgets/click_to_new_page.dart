// ignore_for_file: public_member_api_docs, sort_constructors_first
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

import '../../../../../extension/size_config.dart';

class OnClickToNewPage extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final String text1;
  final VoidCallback onTap;
  final String text2;
  final Color textColor;
  final Color textColor2;
  const OnClickToNewPage({
    Key? key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment =  CrossAxisAlignment.start,
    required this.text1,
    required this.onTap,
    required this.text2,
    required this.textColor,
    required this.textColor2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          text1,
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: textColor,
         
          ),
        ),
        SizedBox(
          width: getProportionateScreenWidth(8),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            text2,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontSize: 16, fontWeight: FontWeight.w500, color: textColor2,
                decoration: TextDecoration.underline,
     decorationThickness: 2,
                ),
          ),
        ),
      ],
    );
  }
}
