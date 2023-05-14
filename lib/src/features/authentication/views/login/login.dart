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
import 'package:acmc/src/features/authentication/views/create_account/widget/title_widget.dart';
import 'package:acmc/src/widgets/special_button_2.dart';
import 'package:flutter/material.dart';

import '../../../../extension/size_config.dart';
import '../../../onboarding/widgets/custom_button.dart';
import '../auth_decide/widgets/click_to_new_page.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? email;
  String? password;
  final _formKey = GlobalKey<FormState>();

  final bool _validate = false;
  late TextEditingController staffIdController;
  late TextEditingController dateController;
  @override
  void initState() {
    super.initState();
    dateController = TextEditingController();
    staffIdController = TextEditingController();
  }

  @override
  void dispose() {
    staffIdController.dispose();
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TitleWidget(
                text: 'Create Account',
                pDleft: getProportionateScreenWidth(20),
                height: getProportionateScreenHeight(36),
                fontSize: 24,
              ),
              SizedBox(
                height: getProportionateScreenHeight(32),
              ),
              CustomTextInput(
                onSaved: (newValue) => email = newValue,
                onChanged: (v) {},
                validator: (v) {
                  return null;
                },
                validate: _validate,
                textInputAction: TextInputAction.next,
                titleText: 'Staff ID',
                keyboardType: TextInputType.number,
                controller: staffIdController,
                prefixIcon: Icons.email,
              ),
              SizedBox(
                height: getProportionateScreenHeight(16),
              ),
              Padding(
                padding:
                    EdgeInsets.only(right: getProportionateScreenWidth(184)),
                child: CustomTextInput(
                  onSaved: (newValue) => email = newValue,
                  onChanged: (v) {},
                  validator: (v) {
                    return null;
                  },
                  validate: _validate,
                  textInputAction: TextInputAction.next,
                  titleText: 'Date of birth',
                  hintText: "dd/mm/yyyy",
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.calendar_month,
                      color: IdColors.hintTextColor,
                    ),
                    onPressed: () {},
                  ),
                  keyboardType: TextInputType.datetime,
                  controller: dateController,
                  prefixIcon: Icons.email,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(24),
              ),
              CustomButton(
                thickLine: 1,
                onpressed: () {},
                text: 'Log in',
                textcolor: IdColors.textColorBlack,
              ),
              SizedBox(
                height: getProportionateScreenHeight(58),
              ),
              Image.asset(
                "assets/images/icon2.png",
                height: getProportionateScreenHeight(73),
                width: getProportionateScreenWidth(73),
              ),
              SizedBox(
                height: getProportionateScreenHeight(58),
              ),
              OnClickToNewPage(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                text1: 'Don\'t have an account?',
                onTap: () {},
                text2: 'Create one',
                textColor: IdColors.textColorBlack,
                textColor2: IdColors.textColorYellow,
              ),
              SizedBox(
                height: getProportionateScreenHeight(17),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: getProportionateScreenWidth(49.5),
                    height: getProportionateScreenHeight(1),
                    color: IdColors.subColor,
                  ),
                  Text(
                    'or',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                  ),
                  Container(
                     width: getProportionateScreenWidth(49.5),
                    height: getProportionateScreenHeight(1),
                    color: IdColors.subColor,
                  ),

                ],
              ),
              SizedBox(height: getProportionateScreenHeight(17),),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(112),),
                child: const SpecialButton2(text: 'Use as guest',)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
