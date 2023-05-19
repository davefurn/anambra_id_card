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
import 'package:acmc/src/extension/size_config.dart';
import 'package:acmc/src/extension/string_extension.dart';
import 'package:acmc/src/features/authentication/services/services.dart';
import 'package:acmc/src/features/authentication/views/create_account/password.dart';
import 'package:acmc/src/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OtpScreen extends ConsumerStatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends ConsumerState<OtpScreen> {
  final otpFormKey = GlobalKey<FormState>();

  late TextEditingController phoneController;
  late TextEditingController emailController;
  // final List<String?> errors = [];

  String buttonName = "Send";

  late Timer _timer;
  int _start = 60;

  verify() {
    ref.read(isLoading.notifier).state = true;

    const oneSec = Duration(milliseconds: 1000);
    _timer = Timer.periodic(oneSec, (timer) {
      ref.read(isLoading.notifier).state = false;
      ref.read(isVerified.notifier).state = true;
    });
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
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isResendAgain1 = ref.watch(isResendAgain);
    final isVerified1 = ref.watch(isVerified);
    final isLoading1 = ref.watch(isLoading);
    final errors1 = ref.watch(errors);

    void addError({String? error}) {
      if (!errors1.contains(error)) {
        ref.read(errors.notifier).state = [error];
        // setState(() {
        //   errors.add(error);
        // });
      }
    }

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
              height: getProportionateScreenHeight(32),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: getProportionateScreenWidth(20),
                right: getProportionateScreenWidth(27),
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
              height: getProportionateScreenHeight(32),
            ),
            Form(
              key: otpFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: getProportionateScreenWidth(20)),
                    child: Text(
                      'Phone OTP',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(8),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(20)),
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.isNotEmpty || !isResendAgain1) {
                          removeError(error: kOtpError);
                        }
                      },
                      validator: (value) {
                        if (value!.isEmpty || isResendAgain1) {
                          addError(error: kOtpError);
                          return "Try again in $_start seconds";
                        }
                        return null;
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
                              : () async {
                                  resend();
                                  otpFormKey.currentState!.validate();

                                  if (isResendAgain1) {
                                    buttonName ==
                                        'Try again in $_start seconds';
                                  } else {
                                    buttonName = 'Send';
                                  }

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
                  SizedBox(
                    height: getProportionateScreenHeight(16),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: getProportionateScreenWidth(20)),
                    child: Text(
                      'Email OTP',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(8),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(20)),
                    child: TextFormField(
                      onChanged: (value) {
                        // if (value.isNotEmpty || !isResendAgain1) {
                        //   removeError(error: kOtpError);
                        // }
                      },
                      validator: (value) {
                        // if (value!.isEmpty || isResendAgain1) {
                        //   addError(error: kOtpError);
                        //   return "Try again in $_start seconds";
                        // }
                        return null;
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
                              : () async {
                                  resend();
                                  otpFormKey.currentState!.validate();
                                  buttonName = isResendAgain1
                                      ? "Try again in $_start seconds"
                                      : "Send";
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
                  SizedBox(
                    height: getProportionateScreenHeight(24),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: MaterialButton(
                      elevation: 0,
                      onPressed: () async {
                        if (otpFormKey.currentState!.validate()) {
                          await verify();
                          Future.delayed(const Duration(seconds: 1), () async {
                            pushTo(context, const PasswordInput());
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
                              : const Text(
                                  "Verify",
                                  style: TextStyle(color: Colors.white),
                                ),
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
