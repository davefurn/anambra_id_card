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
import 'package:acmc/src/extension/size_config.dart';
import 'package:acmc/src/features/onboarding/widgets/custom_button.dart';
import 'package:acmc/src/utils/extension/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuggestImprovement extends StatelessWidget {
  const SuggestImprovement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          textAlign: TextAlign.start,
          'Send feedback',
          style:
              Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 24),
          maxLines: 1,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(
          left: getProportionateScreenWidth(20),
          right: getProportionateScreenWidth(20),
          top: getProportionateScreenWidth(30),
        ),
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: 'What is this about',
              hintStyle: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: IdColors.textColorGrey,
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: IdColors.textColorGrey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
                gapPadding: 8,
              ),
            ),
          ),
          16.sbH,
          SizedBox(
            height: getProportionateScreenHeight(225),
            child: TextFormField(
              minLines: null,
              expands: true,
              maxLines: null,
              textAlignVertical: TextAlignVertical.top,
              decoration: InputDecoration(
                hintText: 'Enter content here',
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: IdColors.textColorGrey,
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: IdColors.textColorGrey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                  gapPadding: 8,
                ),
              ),
            ),
          ),
          16.sbH,
          CustomButton(
            thickLine: 1,
            onpressed: () {},
            text: 'Send feedback',
            hpD: 0,
            textcolor: IdColors.textColorBlack,
            icon: SvgPicture.asset('assets/svgs/send.svg'),
          ),
        ],
      ),
    );
  }
}
