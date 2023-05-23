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

import 'package:acmc/src/features/authentication/views/create_account/success_password.dart';
import 'package:acmc/src/features/authentication/views/create_account/widget/custom_text_input.dart';
import 'package:acmc/src/features/authentication/views/create_account/widget/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/colors.dart';

import '../../../../router/app_routes.dart';
import '../../../onboarding/widgets/custom_button.dart';

class Password2 extends StatefulWidget {
  const Password2({Key? key}) : super(key: key);

  @override
  State<Password2> createState() => _Password2State();
}

class _Password2State extends State<Password2> {
  bool isVisible = false;

  String? password;
  String? confirmPassword;
  final _formKey = GlobalKey<FormState>();

  final bool _validate = false;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
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
                text: 'Create Password',
                pDleft: 20.w,
                height: 36.h,
                fontSize: 24,
              ),
              SizedBox(
                height: 32.h,
              ),
              CustomTextInput(
                onSaved: (newValue) => password = newValue,
                onChanged: (v) {},
                validator: (v) {
                  return null;
                },
                validate: _validate,
                obscureText: isVisible ? false : true,
                textInputAction: TextInputAction.next,
                titleText: 'Password',
                enableSuggestions: false,
                keyboardType: TextInputType.visiblePassword,
                controller: passwordController,
                hintText: 'Enter a minimum of 8 characters',
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
                height: 16.h,
              ),
              CustomTextInput(
                onSaved: (newValue) => confirmPassword = newValue,
                onChanged: (v) {},
                validator: (v) {
                  return null;
                },
                validate: _validate,
                hintText: 'Enter a minimum of 8 characters',
                textInputAction: TextInputAction.done,
                titleText: 'Confirm Password',
                enableSuggestions: false,
                obscureText: isVisible ? false : true,
                keyboardType: TextInputType.visiblePassword,
                controller: confirmPasswordController,
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
              CustomButton(
                thickLine: 1,
                onpressed: () => pushTo(context, const SuccessPassword()),
                text: 'Create password',
                textcolor: IdColors.textColorBlack,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
