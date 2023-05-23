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
import 'package:flutter_svg/svg.dart';

import '../../../../constants/colors.dart';
import '../../../../extension/size_config.dart';

class QueryContainer extends StatelessWidget {
  final List<Color> colors;
  final String svgAsset;
  final String svgAssetText;
  final String description;
  const QueryContainer({
    Key? key,
    required this.colors,
    required this.svgAsset,
    required this.svgAssetText,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          end: Alignment.bottomCenter,
          begin: Alignment.topCenter,
          colors: colors,
        ),
      ),
      padding: EdgeInsets.only(
        top: 23.h,
        bottom: 23.h,
      ),
      child: Column(
        children: [
          SvgPicture.asset(
            svgAsset,
            color: IdColors.backgroundColour,
            width: 40.w,
            height: 40.h,
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
            svgAssetText,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontSize: 16,
                  color: IdColors.backgroundColour,
                ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 4.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 16.w),
            child: Text(
              description,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: IdColors.backgroundColour,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
