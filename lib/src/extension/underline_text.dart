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
extension TextStyleX on TextStyle {
  /// A method to underline a text with a customizable [distance] between the text
  /// and underline. The [color], [thickness] and [style] can be set
  /// as the decorations of a [TextStyle].
  TextStyle underlined({
    Color? color,
    double distance = 1,
    double thickness = 1,
    TextDecorationStyle style = TextDecorationStyle.solid,
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.w700,
  }) {
    return copyWith(
      shadows: [
        Shadow(
          color: this.color ?? IdColors.textColorYellow,
          offset: Offset(0, -distance),
        )
      ],
      color: Colors.transparent,
      decoration: TextDecoration.underline,
      decorationThickness: thickness,
      decorationColor: color ?? IdColors.textColorYellow,
      decorationStyle: style,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }
}
//  Theme.of(context).textTheme.labelMedium!.copyWith(
//                 fontSize: 16, fontWeight: FontWeight.w700, color: textColor2,
//                 decoration: TextDecoration.underline,
//      decorationThickness: 2