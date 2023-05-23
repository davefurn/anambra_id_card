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


import 'package:acmc/src/utils/extension/widget_extension.dart';
import 'package:acmc/src/widgets/special_button_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style:
              Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 24),
          maxLines: 1,
        ),
        
      ),
      body: ListView(
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          top: 30.h,
        ),
        children: [
          const Center(
            child: Text(
              'QR Code',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
          12.sbH,
          SizedBox(
            height: 210.h,
            width: 207.h,
            child: Image.asset(
              'assets/images/qr_code_sample.png',
              fit: BoxFit.fitHeight,
            ),
          ),
          // 8.sbH,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SpecialButton2(
                text: 'Download',
                icon: SvgPicture.asset('assets/svgs/download.svg'),
              ),
              8.sbW,
              SpecialButton2(
                text: 'Share',
                icon: SvgPicture.asset('assets/svgs/share.svg'),
              )
            ],
          ),
          32.sbH,
          const Center(
            child: Text(
              'VCard',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
          12.sbH,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset('assets/svgs/info.svg'),
              const Expanded(
                child: Text(
                  '''Vcard is a file that contains your contact details. It can be downloaded and shared with any individual.
Once they click the file, it opens in their contact app with your contact details ready to be saved automatically.''',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color(0xffA3A3A3),
                  ),
                ),
              ),
            ],
          ),
          12.sbH,
          const Center(
            child: Text(
              'Click to watch how it works',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: Color(0xffD69908),
              ),
            ),
          ),
          12.sbH,
          Center(
            child: SpecialButton2(
              text: 'Download VCard',
              icon: SvgPicture.asset('assets/svgs/download.svg'),
            ),
          )
        ],
      ),
    );
  }
}
