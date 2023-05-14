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
import 'package:acmc/src/features/authentication/views/login/login.dart';
import 'package:acmc/src/features/home/views/bottom_nav.dart';
import 'package:acmc/src/utils/date_time_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
                  onTap: () => Utils.showSheet(context,
                      child: buildDatePicker(), onClicked: () {
                        FocusScope.of(context).requestFocus(FocusNode());

                    final value = DateFormat('yyyy/MM/dd').format(dateTime);
                    dateController.text = value;
                    Navigator.pop(context);
                  }),
                  onSaved: (newValue) => email = newValue,
                  onChanged: (v) {},
                  validator: (v) {
                       if (v!.isEmpty || v.isEmpty) {
                 return 'Choose Date';
               }
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
                  keyboardType: TextInputType.none,
                  controller: dateController,
                  prefixIcon: Icons.email,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(24),
              ),
              CustomButton(
                thickLine: 1,
                onpressed: () {
                  
                  pushToAndClearStack(context, const HomeScreen());
                },
                text: 'Create Account',
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
                text1: 'Already have an account?',
                onTap: () {
                  pushTo(context, const Login());
                },
                text2: 'Login',
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
                    height: getProportionateScreenHeight(1),
                    color: IdColors.subColor,
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(17),
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

  Widget buildDatePicker() => SizedBox(
        height: getProportionateScreenHeight(180),
        child: CupertinoDatePicker(
          minimumYear: 1900,
          maximumYear: DateTime.now().year,
          initialDateTime: dateTime,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (dateTime) =>
              setState(() => this.dateTime = dateTime),
        ),
      );
}
