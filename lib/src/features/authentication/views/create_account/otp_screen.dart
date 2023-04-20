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
import 'package:acmc/src/features/authentication/views/create_account/widget/title_widget.dart';
import 'package:acmc/src/router/app_routes.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  int start = 30;
  bool wait = false;
  String buttonName = "Send";
  TextEditingController phoneController = TextEditingController();
  String verificationIdFinal = "";
  String smsCode = "";

  void setData(String verificationId) {
    setState(() {
      verificationIdFinal = verificationId;
    });
    startTimer();
  }

  void startTimer() {
    const onsec = Duration(seconds: 1);
    Timer timer = Timer.periodic(onsec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
          wait = false;
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: getProportionateScreenWidth(20),
                top: getProportionateScreenHeight(67),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: getProportionateScreenHeight(6)),
                    child: backButton(context),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(16),
                  ),
                  const TitleWidget(
                    text: 'OTP',
                    pDtop: 0,
                    pDleft: 0,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(38),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text('Phone OTP',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  )),
          SizedBox(
            height: getProportionateScreenHeight(8),
          ),
                Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height: 60,
                  decoration: BoxDecoration(
                    color: IdColors.subColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    controller: phoneController,
                    style: const TextStyle(color: IdColors.textColorBlack, fontSize: 17),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                       border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFF3F4F6)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFF3F4F6)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFF3F4F6)),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: IdColors.failureColor,
                ),
                 ),
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 19, horizontal: 8),
                      suffixIcon: InkWell(
                        onTap: wait
                            ? null
                            : () async {
                                setState(() {
                                  start = 30;
                                  wait = true;
                                  buttonName = "Resend code";
                                });
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
                              color: wait ? Colors.grey : Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
