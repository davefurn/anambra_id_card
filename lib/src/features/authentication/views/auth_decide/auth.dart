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
import 'package:acmc/src/features/authentication/views/auth_decide/widgets/click_to_new_page.dart';
import 'package:acmc/src/features/authentication/views/create_account/create_account.dart';
import 'package:acmc/src/features/authentication/views/login/login.dart';

import 'package:acmc/src/features/onboarding/widgets/custom_button.dart';
import 'package:acmc/src/router/app_routes.dart';
import 'package:flutter/material.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: getProportionateScreenWidth(97),
              right: getProportionateScreenWidth(97),
              top: getProportionateScreenHeight(167),
            ),
            child: Image.asset(
              'assets/images/splash.png',
              height: getProportionateScreenHeight(242),
              width: getProportionateScreenWidth(181),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(70),
          ),
          Column(
            children: [
              CustomButton(
                text: "Create account",
                onpressed: () {
                   pushTo(context, const CreateAccount());
                },
                thickLine: 1,
              ),
              SizedBox(
                height: getProportionateScreenHeight(8),
              ),
              CustomButton(
                text: 'Use as guest',
                onpressed: () {
                 
                },
                thickLine: 1,
                color: IdColors.backgroundColour,
                borderColor: IdColors.subColor,
              ),
              SizedBox(
                height: getProportionateScreenHeight(35),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
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
