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

import '../constants/colors.dart';
class DataTesting extends StatelessWidget {
  final String firstText;
  final String secondText;
  final Color color;
  final FontWeight fontWeight;
  const DataTesting({
    Key? key,
    required this.firstText,
    required this.secondText,
    this.color = IdColors.textColorBlack,
    this.fontWeight = FontWeight.w400,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          firstText,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: IdColors.textColorGrey,
              ),
        ),
        Text(
          secondText,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: fontWeight,
                fontSize: 16,
                color: color,
              ),
        ),
      ],
    );
  }
}
