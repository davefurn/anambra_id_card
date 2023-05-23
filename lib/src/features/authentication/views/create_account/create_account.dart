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
import 'package:acmc/src/features/authentication/views/create_account/create_account_2.dart';

import 'package:acmc/src/features/authentication/views/create_account/widget/custom_text_input.dart';
import 'package:acmc/src/features/authentication/views/create_account/widget/title_widget.dart';
import 'package:acmc/src/features/authentication/views/login/login.dart';

import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../../extension/size_config.dart';
import '../../../../router/app_routes.dart';
import '../../../../widgets/special_button_2.dart';
import '../../../onboarding/widgets/custom_button.dart';
import '../auth_decide/widgets/click_to_new_page.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  DateTime dateTime = DateTime.now();
  String? email;
  String? phoneNumber;
  final _formKey = GlobalKey<FormState>();
  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');

  final bool _validate = false;
  late TextEditingController emailController;
  late TextEditingController phoneNumberController;
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    phoneNumberController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    phoneNumberController.dispose();
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
                text: 'Create Account 1/2',
                pDleft: getProportionateScreenWidth(20),
                height: 36.h,
                fontSize: 24,
              ),
              SizedBox(
                height: 32.h,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: getProportionateScreenWidth(20),
                    right: getProportionateScreenWidth(20)),
                child: InternationalPhoneNumberInput(
                  spaceBetweenSelectorAndTextField: 0,
                  onInputChanged: (PhoneNumber number) {
                    print(number.phoneNumber);
                  },
                  onInputValidated: (bool value) {
                    print(value);
                  },
                  textStyle: const TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    height: 1,
                    color: Color(0xFF1F2937),
                  ),
                  inputDecoration: InputDecoration(
                    // contentPadding: EdgeInsets.symmetric(
                    //   vertical: 15.h,
                    //   horizontal: prefix != null ? 15.w : 12.w,
                    // ),
                    hintText: 'Phone Number',
                    hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 16,
                          color: IdColors.hintTextColor,
                        ),
                    fillColor: IdColors.subColor,
                    filled: true,
                  ),
                  selectorConfig: const SelectorConfig(
                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  ),
                  ignoreBlank: false,
                  autoValidateMode: AutovalidateMode.disabled,
                  selectorTextStyle: const TextStyle(color: Colors.black),
                  initialValue: number,
                  textFieldController: phoneNumberController,
                  formatInput: true,
                  keyboardType: const TextInputType.numberWithOptions(
                      signed: true, decimal: true),
                  onSaved: (PhoneNumber number) {
                    print('On Saved: $number');
                  },
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomTextInput(
                onSaved: (newValue) => email = newValue,
                onChanged: (v) {},
                validator: (v) {
                  return null;
                },
                validate: _validate,
                textInputAction: TextInputAction.done,
                titleText: 'Email',
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                prefixIcon: Icons.email,
              ),
              SizedBox(
                height: 24.h,
              ),
              CustomButton(
                thickLine: 1,
                onpressed: () {
                  Navigator.of(context)
                      .push(CustomRoutes.slideIn(const CreateAccount2()));
                },
                text: 'Next',
                textcolor: IdColors.textColorBlack,
              ),
              SizedBox(
                height: 58.h,
              ),
              Image.asset(
                "assets/images/icon2.png",
                height: 73.h,
                width: getProportionateScreenWidth(73),
              ),
              SizedBox(
                height: 58.h,
              ),
              OnClickToNewPage(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                text1: 'Already have an account?',
                onTap: () {
                  Navigator.of(context)
                      .pushReplacement(CustomRoutes.slideIn(const Login()));
                },
                text2: 'Log in',
                textColor: IdColors.textColorBlack,
                textColor2: IdColors.textColorYellow,
              ),
              SizedBox(
                height: 17.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: getProportionateScreenWidth(49.5),
                    height: 1.h,
                    color: IdColors.subColor,
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(2),
                  ),
                  Text(
                    'or',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(2),
                  ),
                  Container(
                    width: getProportionateScreenWidth(49.5),
                    height: 1.h,
                    color: IdColors.subColor,
                  ),
                ],
              ),
              SizedBox(
                height: 17.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(112),
                ),
                child: const SpecialButton2(
                  text: 'Use as guest',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
