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
import 'package:acmc/src/features/authentication/views/create_account/widget/custom_text_input.dart';
import 'package:acmc/src/features/home/views/bottom_nav.dart';
import 'package:acmc/src/router/app_routes.dart';
import 'package:acmc/src/utils/extension/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/enums.dart';
import '../../widgets/loading_button.dart';
import '../../widgets/special_button_2.dart';

class ScheduleDetails extends StatefulWidget {
  const ScheduleDetails({super.key});

  @override
  State<ScheduleDetails> createState() => _ScheduleDetailsState();
}

class _ScheduleDetailsState extends State<ScheduleDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          textAlign: TextAlign.start,
          'Schedule Appointment',
          style:
              Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 24),
        ),
      ),
      body: Column(
        children: [
          32.sbH,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                const Expanded(
                    child: CustomTextInput(
                  titleText: 'Choose Date',
                  hpD: 0,
                  suffixIcon: Icon(
                    Icons.date_range,
                    color: IdColors.grey,
                  ),
                )),
                10.sbW,
                const Expanded(
                    child: CustomTextInput(
                  titleText: 'Choose Time',
                  hpD: 0,
                  suffixIcon: Icon(
                    Icons.timer,
                    color: IdColors.grey,
                  ),
                )),
              ],
            ),
          ),
          21.sbH,
          const CustomTextInput(
            titleText: 'Purpose of visit',
            maxLines: 5,
            textAlignVertical: TextAlignVertical.top,
            suffixText: '0/50',
          ),
          24.sbH,
          LoadingButton(
            state: LoadingState.normal,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => SimpleDialog(
                  surfaceTintColor: Colors.white,
                  contentPadding: EdgeInsets.all(20.r),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  title: Icon(
                    Icons.verified,
                    size: 34.sp,
                    color: IdColors.green,
                  ),
                  children: [
                    Text(
                      'Your request has been submitted successfully',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    10.sbH,
                    Text(
                      'The necessary information will be sent to your email and text message inbox when your request has been processed.',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    10.sbH,
                    Center(
                      child: SpecialButton2(
                        onTap: () {
                          pushToAndClearStack(context, const HomeScreen());
                        },
                        // height: 32.h,
                        text: 'Return to home',
                        backgroundColor: IdColors.backgroundColour,
                        borderColor: Colors.grey,
                        textColor: Colors.black,
                      ),
                    )
                  ],
                ),
              );
            },
            text: 'Submit Form',
          )
        ],
      ),
    );
  }
}
