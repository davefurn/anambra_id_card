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

import 'package:acmc/src/features/authentication/create_account/widget/custom_text_input.dart';
import 'package:acmc/src/features/authentication/create_account/widget/title_widget.dart';
import 'package:acmc/src/features/authentication/login/login.dart';
import 'package:acmc/src/features/privacy_policy/terms.dart';
import 'package:acmc/src/features/search/search_parameters/search_parameters.dart';
import 'package:acmc/src/model/enums.dart';
import 'package:acmc/src/router/app_routes.dart';
import 'package:acmc/src/services/flush.dart';
import 'package:acmc/src/services/post_requests.dart';
import 'package:acmc/src/widgets/loading_button.dart';
import 'package:acmc/src/widgets/special_button_2.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import '../auth_decide/widgets/click_to_new_page.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _formKey = GlobalKey<FormState>();
  String initialCountry = 'NG';
  var state = LoadingState.normal;
  bool submitted = false;
  bool? checkBox = false;

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

  Future<void> register() async {
    setState(() {
      state = LoadingState.loading;
    });
    await PostRequest.register({
      'email': emailController.text,
      'mobile_number': phoneNumberController.text,
    }, context);
    setState(() {
      state = LoadingState.normal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TitleWidget(
                text: 'Create Account',
                pDleft: 20.w,
                height: 36.h,
                fontSize: 24,
              ),
              SizedBox(
                height: 32.h,
              ),
              CustomTextInput(
                validator: (String? value) {
                  if ((value == null || value.isEmpty) ||
                      !RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
                          .hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                textInputAction: TextInputAction.done,
                titleText: 'Email',
                hintText: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                prefixIcon: Icons.email,
                autovalidateMode: submitted
                    ? AutovalidateMode.onUserInteraction
                    : AutovalidateMode.disabled,
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomTextInput(
                onChanged: (v) {},
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return 'Please enter a mobile number';
                  } else if (!v.startsWith('0')) {
                    return 'Please enter a valid mobile number';
                  } else if (v.length > 11) {
                    return 'The phone number is incorrect';
                  }
                  return null;
                },
                textInputAction: TextInputAction.done,
                titleText: 'Phone number',
                keyboardType: TextInputType.number,
                controller: phoneNumberController,
                prefixIcon: Icons.email,
                autovalidateMode: submitted
                    ? AutovalidateMode.onUserInteraction
                    : AutovalidateMode.disabled,
              ),
              SizedBox(
                height: 24.h,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 10.w,
                  right: 10.w,
                ),
                child: Row(
                  children: [
                    Checkbox(
                      value: checkBox,
                      checkColor: IdColors.textColorBlack,
                      activeColor: IdColors.mainColor,
                      onChanged: (value) => setState(() => checkBox = value),
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'I agree to the ',
                              style: TextStyle(
                                color: IdColors.textColorBlack,
                              ),
                            ),
                            TextSpan(
                              text: 'Terms & Conditions ',
                              style: const TextStyle(
                                color: IdColors.mainColor,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => pushTo(
                                      context,
                                      const TermsAndCondition(),
                                    ),
                            ),
                            const TextSpan(
                              text: 'and ',
                              style: TextStyle(
                                color: IdColors.textColorBlack,
                              ),
                            ),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: const TextStyle(
                                color: IdColors.mainColor,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => launchUrl(
                                      Uri.parse(
                                          'https://ict.anambrastate.gov.ng/e-id-policy/'),
                                    ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              LoadingButton(
                state: state,
                onTap: () {
                  setState(() => submitted = true);
                  if (_formKey.currentState!.validate()) {
                    if (checkBox != true) {
                      ShowFlushBar.showError(
                        context: context,
                        error: 'Please accept the application terms',
                      );
                    } else {
                      register();
                    }
                  }
                },
                text: 'Next',
              ),
              SizedBox(
                height: 58.h,
              ),
              Image.asset(
                "assets/images/icon2.png",
                height: 73.h,
                width: 73.w,
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
                      .pushReplacement(CustomRoutes.fadeIn(const Login()));
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
                    width: 49.5.w,
                    height: 1.h,
                    color: IdColors.subColor,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    'or',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Container(
                    width: 49.5.w,
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
                  horizontal: 112.w,
                ),
                child: GestureDetector(
                  onTap: () => pushTo(
                    context,
                    const SearchParameters(
                      asGuest: true,
                    ),
                  ),
                  child: const SpecialButton2(
                    text: 'Use as guest',
                    textColor: IdColors.textColorBlack,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
