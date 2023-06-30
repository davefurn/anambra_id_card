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

import 'package:acmc/src/model/enums.dart';
import 'package:acmc/src/services/post_requests.dart';
import 'package:acmc/src/utils/extension/widget_extension.dart';
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

  late TextEditingController phoneController;
  late TextEditingController emailController;
  // final List<String?> errors = [];
  bool submitted = false;

  var state = LoadingState.normal;

  Timer? _timer;
  Duration timeLapse = const Duration(seconds: 60);

  Future<void> verify() async {
    setState(() {
      state = LoadingState.loading;
    });
    FocusScope.of(context).unfocus();
    await PostRequest.verifyOtp({
      'email_otp': emailController.text,
      'mobile_otp': phoneController.text,
    }, context);
    setState(() {
      state = LoadingState.normal;
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

  void resend() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      timeLapse -= const Duration(seconds: 1);
      if (timeLapse == Duration.zero) {
        _timer?.cancel();
        _timer = null;
        if (mounted) setState(() {});
      }
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter the recieved phone token";
                        } else if (value.length != 6) {
                          return "The token length is not correct";
                        }
                        return null;
                      },
                      controller: phoneController,
                      style: const TextStyle(
                          color: IdColors.textColorBlack, fontSize: 17),
                      autovalidateMode: submitted
                          ? AutovalidateMode.onUserInteraction
                          : AutovalidateMode.disabled,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        fillColor: IdColors.subColor,
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 19,
                          horizontal: 8,
                        ),
                      ),
                    ),
                  ),
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter the recieved email token";
                        } else if (value.length != 6) {
                          return "The token length is not correct";
                        }
                        return null;
                      },
                      controller: emailController,
                      style: const TextStyle(
                          color: IdColors.textColorBlack, fontSize: 17),
                      autovalidateMode: submitted
                          ? AutovalidateMode.onUserInteraction
                          : AutovalidateMode.disabled,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        fillColor: IdColors.subColor,
                        filled: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 19, horizontal: 8),
                      ),
                    ),
                  ),
                  2.sbH,
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: TextButton(
                        onPressed: () {
                          if (_timer == null) {
                            timeLapse = const Duration(seconds: 60);
                            resend();
                          }
                        },
                        child: Text(
                          _timer != null
                              ? "${timeLapse.inMinutes}:${'${timeLapse.inSeconds}'.padLeft(2, '0')}"
                              : 'Resend Code',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  8.sbH,
                  Align(
                    alignment: Alignment.center,
                    child: LoadingButton(
                      state: state,
                      onTap: () {
                        setState(() => submitted = true);
                        if (otpFormKey.currentState!.validate()) {
                          verify();
                        }
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
