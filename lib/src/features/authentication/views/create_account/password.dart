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
import 'package:acmc/src/features/authentication/views/create_account/password2.dart';
import 'package:acmc/src/router/app_routes.dart';
import 'package:acmc/src/widgets/special_button_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../constants/colors.dart';
import '../../../../widgets/data_testing.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({Key? key}) : super(key: key);

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
      reverseDuration: const Duration(seconds: 5),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.repeat();
    goToVerify();
  }

  Future<void> goToVerify() async {
    Future.delayed(const Duration(seconds: 5), () {})
        .whenComplete(() => pushReplacementTo(context, const VerifyDetails()));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/lottie/searching e-id card.json',
          controller: _animation,
        ),
      ),
    );
  }
}

class VerifyDetails extends StatefulWidget {
  const VerifyDetails({super.key});

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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        const DataTesting(
                          firstText: 'First Name',
                          secondText: 'Chidinma',
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        const DataTesting(
                          firstText: 'Middle Name',
                          secondText: 'Deborah',
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        const DataTesting(
                          firstText: 'Last Name',
                          secondText: 'Madula',
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        const DataTesting(
                          firstText: 'Email',
                          secondText: 'debbiedinma44@gmail.com',
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        const DataTesting(
                          firstText: 'Phone number',
                          secondText: '08164684852',
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
                              CustomRoutes.slideIn(const Password2()),
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
