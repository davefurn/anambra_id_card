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
import 'package:acmc/src/features/authentication/views/create_account/create_account.dart';
import 'package:acmc/src/features/authentication/views/create_account/widget/custom_text_input.dart';
import 'package:acmc/src/features/authentication/views/create_account/widget/title_widget.dart';
import 'package:acmc/src/features/search/search_parameters/views/search_parameters.dart';

import 'package:acmc/src/model/enums.dart';
import 'package:acmc/src/services/post_requests.dart';
import 'package:acmc/src/widgets/loading_button.dart';
import 'package:acmc/src/widgets/special_button_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../router/app_routes.dart';
import '../auth_decide/widgets/click_to_new_page.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  late TextEditingController passwordController;
  bool isVisible = false;
  final _formKey = GlobalKey<FormState>();
  bool submitted = false;

  late TextEditingController emailController;
  var state = LoadingState.normal;

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> verify() async {
    setState(() {
      state = LoadingState.loading;
    });
    await PostRequest.fetchBearerToken(
      context,
      login: true,
      email: emailController.text,
      password: passwordController.text,
      ref: ref,
    );
    setState(() {
      state = LoadingState.normal;
    });
    await Future.delayed(const Duration(milliseconds: 500));
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
                text: 'Log in',
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
                textInputAction: TextInputAction.next,
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
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return 'Please enter a password';
                  } else if (v.length < 6) {
                    return 'The password is too short';
                  }
                  return null;
                },
                hintText: 'Enter a minimum of 6 characters',
                textInputAction: TextInputAction.done,
                titleText: 'Password',
                enableSuggestions: false,
                obscureText: isVisible ? false : true,
                keyboardType: TextInputType.visiblePassword,
                controller: passwordController,
                autovalidateMode: submitted
                    ? AutovalidateMode.onUserInteraction
                    : AutovalidateMode.disabled,
                suffixIcon: IconButton(
                  icon: Icon(
                    isVisible ? Icons.visibility : Icons.visibility_off,
                    color: IdColors.textColorGrey,
                  ),
                  onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              LoadingButton(
                state: state,
                onTap: () {
                  setState(() => submitted = true);
                  if (_formKey.currentState!.validate()) {
                    verify();
                  }
                },
                text: 'Log in',
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
                text1: 'Don\'t have an account?',
                onTap: () => pushReplacementTo(context, const CreateAccount()),
                text2: 'Create one',
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
                  Text(
                    'or',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
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
                child: SpecialButton2(
                  text: 'Use as guest',
                  onTap: () => pushTo(
                      context,
                      const SearchParameters(
                        asGuest: true,
                      )),
                  textColor: IdColors.textColorBlack,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
