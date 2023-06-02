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

import 'package:acmc/src/features/onboarding/widgets/custom_button.dart';
import 'package:acmc/src/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';
import '../../authentication/views/auth_decide/auth.dart';

class Onboard extends StatelessWidget {
  const Onboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("assets/images/onboarding.png"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.61),
              BlendMode.darken,
            ),
          ),
        ),
        padding: EdgeInsets.only(bottom: 110.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 40.w,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Scan or search an individuals identity",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontSize: 24,
                          color: IdColors.backgroundColour,
                          fontWeight: FontWeight.w600,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "The Anambra ID Scanner allows you scan a QR code or search the states database for any employees information",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 16,
                          color: IdColors.backgroundColour,
                          fontWeight: FontWeight.w500,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 29.h,
            ),
            CustomButton(
              text: 'Next',
              onpressed: () {
                pushReplacementTo(context, const Auth());
              },
              thickLine: 1,
            ),
          ],
        ),
      ),
    );
  }
}
