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

import 'package:acmc/src/extension/string_extension.dart';
import 'package:acmc/src/features/authentication/services/services.dart';
import 'package:acmc/src/features/authentication/views/create_account/password.dart';
import 'package:acmc/src/model/enums.dart';
import 'package:acmc/src/router/app_routes.dart';
import 'package:acmc/src/widgets/loading_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpScreen extends ConsumerStatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends ConsumerState<OtpScreen> {
  final otpFormKey = GlobalKey<FormState>();
  int _start = 60;

  late String text = "Sending code in $_start seconds";

  late TextEditingController phoneController;
  late TextEditingController emailController;
  // final List<String?> errors = [];

  String buttonName = "Resend code";
  var state = LoadingState.normal;

  Timer? _timer;

  Future<void> verify() async {
    setState(() {
      state = LoadingState.loading;
    });
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      state = LoadingState.finished;
    });
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  void initState() {
    super.initState();
    phoneController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    phoneController.dispose();
    emailController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isResendAgain1 = ref.watch(isResendAgain);

    final errors1 = ref.watch(errors);
    final errorColor1 = ref.watch(errorColor);

    void removeError({String? error}) async {
      if (errors1.contains(error) && _start == 0) {
        ref.read(errors.notifier).state = [];
      }
    }

    void resend() {
      ref.read(isResendAgain.notifier).state = true;

      const oneSec = Duration(seconds: 1);
      _timer = Timer.periodic(oneSec, (timer) {
        if (_start == 0) {
          _start = 60;
          ref.read(isResendAgain.notifier).state = false;

          removeError(error: kOtpError);
          timer.cancel();
        } else {
          _start--;
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          textAlign: TextAlign.start,
          'OTP',
          style:
              Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 24),
          maxLines: 1,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 32.h,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 20.w,
                right: 27.w,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.info_outline,
                    color: IdColors.brandBlue,
                    size: 20,
                  ),
                  Text(
                    'An OTP was automatically sent to your phone and email after entering your details.\nEnter both to proceed.',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: IdColors.otpGrey,
                        ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            Form(
              key: otpFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Text(
                      'Phone OTP',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: TextFormField(
                      onChanged: (value) {
                        // if (value.isNotEmpty || !isResendAgain1) {
                        //   removeError(error: kOtpError);
                        // }
                      },
                      validator: (value) {
                        return null;

                        // if (value!.isEmpty || isResendAgain1) {
                        //   addError(error: kOtpError);
                        //   return "Try again in $_start seconds";
                        // }
                        // return null;
                      },
                      controller: phoneController,
                      style: const TextStyle(
                          color: IdColors.textColorBlack, fontSize: 17),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        fillColor: IdColors.subColor,
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 19, horizontal: 8),
                        suffixIcon: InkWell(
                          onTap: isResendAgain1
                              ? null
                              : () {
                                  resend();

                                  // await authClass.verifyPhoneNumber(
                                  //     "+91 ${phoneController.text}",
                                  //     context,
                                  //     setData);
                                },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 15),
                            child: Text(
                              buttonName,
                              style: TextStyle(
                                color:
                                    isResendAgain1 ? Colors.grey : Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  isResendAgain1 == true
                      ? Padding(
                          padding: EdgeInsets.only(right: 20.w, top: 8.h),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              text,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: errorColor1 == true
                                          ? IdColors.failureColor
                                          : IdColors.mainColor),
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                  SizedBox(
                    height: 16.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Text(
                      'Email OTP',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: TextFormField(
                      onChanged: (value) {
                        // if (value.isNotEmpty || !isResendAgain1) {
                        //   removeError(error: kOtpError);
                        // }
                      },
                      validator: (value) {
                        return null;

                        // if (value!.isEmpty || isResendAgain1) {
                        //   addError(error: kOtpError);
                        //   return "Try again in $_start seconds";
                        // }
                        // return null;
                      },
                      controller: emailController,
                      style: const TextStyle(
                          color: IdColors.textColorBlack, fontSize: 17),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixIcon: null,
                        fillColor: IdColors.subColor,
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 19, horizontal: 8),
                        suffixIcon: InkWell(
                          onTap: isResendAgain1
                              ? null
                              : () {
                                  resend();
                                  otpFormKey.currentState!.validate();

                                  // await authClass.verifyPhoneNumber(
                                  //     "+91 ${phoneController.text}",
                                  //     context,
                                  //     setData);
                                },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 15),
                            child: Text(
                              buttonName,
                              style: TextStyle(
                                color:
                                    isResendAgain1 ? Colors.grey : Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  isResendAgain1 == true
                      ? Padding(
                          padding: EdgeInsets.only(right: 20.w, top: 8.h),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              errorColor1 == true ? 'incorrect otp' : text,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: errorColor1 == true
                                          ? IdColors.failureColor
                                          : IdColors.mainColor),
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                  SizedBox(
                    height: 24.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: LoadingButton(
                      state: state,
                      onTap: () {
                        verify().then((value) {
                          setState(() {
                            state = LoadingState.normal;
                          });
                          return pushTo(
                            context,
                            const VerifyDetails(),
                          );
                        });
                      },
                      text: 'Verify',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
