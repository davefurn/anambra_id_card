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

import 'dart:async';

import 'package:acmc/src/constants/colors.dart';
import 'package:acmc/src/features/authentication/views/create_account/otp_screen.dart';
import 'package:acmc/src/features/authentication/views/create_account/widget/custom_text_input.dart';
import 'package:acmc/src/features/authentication/views/create_account/widget/title_widget.dart';
import 'package:acmc/src/features/authentication/views/login/login.dart';
import 'package:acmc/src/utils/date_time_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../../router/app_routes.dart';
import '../../../../widgets/special_button_2.dart';
import '../../services/services.dart';
import '../auth_decide/widgets/click_to_new_page.dart';

class CreateAccount2 extends ConsumerStatefulWidget {
  const CreateAccount2({super.key});

  @override
  ConsumerState<CreateAccount2> createState() => _CreateAccount2State();
}

class _CreateAccount2State extends ConsumerState<CreateAccount2> {
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
  
 
 Future<void>verify() async {
    ref.read(isLoading.notifier).state = true;

    const oneSec = Duration(milliseconds: 1000);
    
    Timer.periodic(oneSec, (timer) {
      ref.read(isLoading.notifier).state = false;
      ref.read(isVerified.notifier).state = true;
    });
  }


  @override
  void dispose() {
    staffIdController.dispose();
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isVerified1 = ref.watch(isVerified);
    final isLoading1 = ref.watch(isLoading);
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TitleWidget(
                text: 'Create Account 2/2',
                pDleft: 20.w,
                height: 36.h,
                fontSize: 24,
              ),
              SizedBox(
                height: 32.h,
              ),
              CustomTextInput(
                onSaved: (newValue) => email = newValue,
                onChanged: (v) {},
                validator: (v) {
                  return null;
                },
                validate: _validate,
                textInputAction: TextInputAction.next,
                titleText: 'Surname',
                keyboardType: TextInputType.number,
                controller: staffIdController,
                prefixIcon: Icons.email,
              ),
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 184.w),
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
                height: 24.h,
              ),
              Align(
                alignment: Alignment.center,
                child: MaterialButton(
                  elevation: 0,
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await verify();
                      Future.delayed(const Duration(seconds: 1), () async {
                        pushTo(context, const OtpScreen());
                      });
                    }
                  },
                  color: IdColors.mainColor,
                  minWidth: MediaQuery.of(context).size.width * 0.9,
                  height: 50,
                  child: isLoading1
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.white,
                            strokeWidth: 3,
                            color: Colors.black,
                          ),
                        )
                      : isVerified1
                          ? const Icon(
                              Icons.check_circle,
                              color: Colors.white,
                              size: 30,
                            )
                          : Text(
                              "Create Account",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontSize: 16,
                                    color: IdColors.textColorBlack,
                                  ),
                            ),
                ),
              ),

              // Navigate to the new page.

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
                onTap: () => pushReplacementTo(context, const Login()),
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
        height: 180.h,
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
