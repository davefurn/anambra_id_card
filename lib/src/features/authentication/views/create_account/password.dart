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

import 'package:acmc/src/features/authentication/views/create_account/create_account.dart';
import 'package:acmc/src/model/auth_model.dart';
import 'package:acmc/src/router/app_routes.dart';
import 'package:acmc/src/widgets/animation_screen.dart';
import 'package:acmc/src/widgets/special_button_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants/colors.dart';
import '../../../../widgets/data_testing.dart';

class VerifyDetails extends StatefulWidget {
  final VerifiedUserData data;
  const VerifyDetails({super.key, required this.data});

  @override
  State<VerifyDetails> createState() => _VerifyDetailsState();
}

class _VerifyDetailsState extends State<VerifyDetails> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showDialog(
        context: context,
        builder: (context) => WillPopScope(
          onWillPop: () async => false,
          child: Dialog(
            backgroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 10,
            shadowColor: Colors.black54,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.info_outline,
                      color: IdColors.brandBlue,
                      size: 33,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      'Is this you?',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: IdColors.textColorBlack,
                          ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      'If YES, your phone number is ',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: IdColors.textColorBlack,
                          ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          DataTesting(
                            firstText: 'Staff Id',
                            secondText: widget.data.staffId,
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          DataTesting(
                            firstText: 'First Name',
                            secondText: widget.data.firstName,
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          DataTesting(
                            firstText: 'Last Name',
                            secondText: widget.data.lastName,
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          DataTesting(
                            firstText: 'Email',
                            secondText: widget.data.email,
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          DataTesting(
                            firstText: 'Phone number',
                            secondText: widget.data.mobile,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () => pushToAndClearStack(
                                context, const CreateAccount()),
                            child: SpecialButton2(
                              text: 'Not me',
                              height: 40.h,
                              backgroundColor: Colors.transparent,
                              borderColor: IdColors.grey,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                CustomRoutes.slideIn(
                                    const AnimationScreen(isLogin: true)),
                              );
                            },
                            child: SpecialButton2(
                              text: 'Yes',
                              height: 40.h,
                              backgroundColor: IdColors.mainColor,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(),
    );
  }
}
