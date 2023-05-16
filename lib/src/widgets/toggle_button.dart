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
import '../extension/size_config.dart';

class ToggleButton extends StatelessWidget {
  final String text;
  const ToggleButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(32),
      decoration: BoxDecoration(
          border: Border.all(color: IdColors.subColor),
          color: IdColors.backgroundColour,
          borderRadius: BorderRadius.circular(8)),
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(12),
          vertical: getProportionateScreenHeight(7)),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 14,
              color: IdColors.textColorGrey,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}
