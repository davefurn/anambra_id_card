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
import 'package:acmc/src/utils/extension/widget_extension.dart';
import 'package:acmc/src/widgets/card.dart';
import 'package:acmc/src/widgets/special_button_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VirtualIDCard extends StatelessWidget {
  const VirtualIDCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          textAlign: TextAlign.start,
          'View ID Card',
          style:
              Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 24),
          maxLines: 1,
        ),
      ),
      body: Column(
        children: [
          37.sbH,
          Padding(
            padding: EdgeInsets.only(right: 20.h),
            child: const Align(
              alignment: Alignment.topRight,
              child: SpecialButton2(
                icon: Icon(
                  Icons.download,
                  size: 15,
                ),
                text: 'Download Front',
                // width: 132,
                // height: 32,
                backgroundColor: Colors.transparent,
                // borderColor: Colors.transparent,
              ),
            ),
          ),
          12.sbH,
          const Cards(
            text: 'MDA: ICT Agency',
            logo: 'assets/images/gov_logo.png',
            image: 'assets/images/test_image.png',
            name: 'Chidinma Deborah Maduka',
            department: 'Commissioner',
            showDetails: false,
          ),
          37.sbH,
          Padding(
            padding: EdgeInsets.only(right: 20.h),
            child: const Align(
              alignment: Alignment.topRight,
              child: SpecialButton2(
                icon: Icon(
                  Icons.download,
                  size: 15,
                ),
                text: 'Download Back',
                // width: 132,
                // height: 32,
                backgroundColor: Colors.transparent,
                // borderColor: Colors.transparent,
              ),
            ),
          ),
          12.sbH,
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: IdColors.backgroundColour,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 0,
                  blurRadius: 25,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 15.w, top: 12.h),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: Image.asset('assets/images/gov_logo.png')),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: SizedBox(
                      width: 119.w,
                      height: 121.h,
                      child: Image.asset(
                        'assets/images/qr_code_sample.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                12.sbH,
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(12)),
                  child: SizedBox(
                    height: 10,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            color: IdColors.mainColor,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: IdColors.blue,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: IdColors.mainColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
