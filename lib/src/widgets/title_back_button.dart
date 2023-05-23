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
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../features/authentication/views/create_account/widget/title_widget.dart';
import '../router/app_routes.dart';

class TitleWithBackButton extends StatelessWidget {
  final String text;
  final double width;
  const TitleWithBackButton({
    Key? key,
    required this.text,
    this.width = 181,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20.w,
        top: 61.h,
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 6.h),
            child: backButton(context),
          ),
          SizedBox(
            width: 16.w,
          ),
          TitleWidget(
            width: width,
            text: text,
            pDtop: 0,
            pDleft: 0,
          ),
        ],
      ),
    );
  }
}
