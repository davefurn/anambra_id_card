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
import 'package:acmc/src/features/authentication/views/auth_decide/widgets/click_to_new_page.dart';
import 'package:acmc/src/features/authentication/views/create_account/create_account.dart';
import 'package:acmc/src/features/authentication/views/login/login.dart';
import 'package:acmc/src/features/onboarding/widgets/custom_button.dart';
import 'package:acmc/src/features/search/search_parameters/views/search_parameters.dart';
import 'package:acmc/src/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 97.w,
              right: 97.w,
              top: 167.h,
            ),
            child: Image.asset(
              'assets/images/splash.png',
              height: 242.h,
              width: 181.w,
            ),
          ),
          SizedBox(
            height: 70.h,
          ),
          Column(
            children: [
              CustomButton(
                text: "Create account",
                onpressed: () => pushTo(context, const CreateAccount()),
                thickLine: 1,
              ),
              SizedBox(
                height: 8.h,
              ),
              CustomButton(
                text: 'Use as guest',
                onpressed: () => pushTo(
                  context,
                  const SearchParameters(
                    asGuest: true,
                  ),
                ),
                thickLine: 1,
                color: IdColors.backgroundColour,
                textcolor: IdColors.textColorBlack,
                borderColor: IdColors.subColor,
              ),
              SizedBox(
                height: 35.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: OnClickToNewPage(
                  text1: "Already have an account?",
                  onTap: () {
                    pushTo(context, const Login());
                  },
                  text2: "Log in",
                  textColor: IdColors.textColorGrey,
                  textColor2: IdColors.textColorYellow,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
