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

import 'package:acmc/src/extension/size_config.dart';
import 'package:acmc/src/features/authentication/views/auth_decide/auth.dart';
import 'package:acmc/src/features/authentication/views/create_account/create_account.dart';
import 'package:acmc/src/features/authentication/views/create_account/password2.dart';
import 'package:acmc/src/features/onboarding/widgets/custom_button.dart';
import 'package:acmc/src/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
    );
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
        child: SizedBox(
          height: getProportionateScreenHeight(400),
          width: getProportionateScreenWidth(300),
          child: Lottie.asset('assets/lottie/searching e-id card.json',
              controller: _controller, onLoaded: (composition) {
            _controller
              ..duration = Duration(milliseconds: 3000)
              ..forward().whenComplete(
                () => showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (_) {
                    return Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: IdColors.backgroundColour,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.all(16),
                        margin: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(54),
                        ).copyWith(
                            bottom: getProportionateScreenHeight(206),
                            top: getProportionateScreenHeight(126)),
                        child: Column(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.info_outline,
                                  color: IdColors.brandBlue,
                                  size: 33,
                                ),
                                SizedBox(
                                  height: getProportionateScreenHeight(4),
                                ),
                                Text(
                                  'Is this you?',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: IdColors.textColorBlack,
                                      ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: getProportionateScreenHeight(10),
                                  ),
                                  const DataTesting(
                                    firstText: 'First Name',
                                    secondText: 'Chidinma',
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(16),
                                  ),
                                  const DataTesting(
                                    firstText: 'Middle Name',
                                    secondText: 'Deborah',
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(16),
                                  ),
                                  const DataTesting(
                                    firstText: 'Last Name',
                                    secondText: 'Madula',
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(16),
                                  ),
                                  const DataTesting(
                                    firstText: 'Email',
                                    secondText: 'debbiedinma44@gmail.com',
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(16),
                                  ),
                                  const DataTesting(
                                    firstText: 'Phone number',
                                    secondText: '08164684852',
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(24),
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () => pushToAndClearStack(
                                      context, const CreateAccount()),
                                  child: Container(
                                    height: getProportionateScreenHeight(40),
                                    width: getProportionateScreenWidth(112.5),
                                    decoration: BoxDecoration(
                                      color: IdColors.backgroundColour,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: Color(0xffBCC2CC), width: 1),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Not me',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: IdColors.textColorBlack,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: getProportionateScreenWidth(10),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        CustomRoutes.slideIn(const Password2()),
                                        );
                                  },
                                  child: Container(
                                    height: getProportionateScreenHeight(40),
                                    width: getProportionateScreenWidth(112.5),
                                    decoration: BoxDecoration(
                                      color: IdColors.mainColor,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Yes',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: IdColors.textColorBlack,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
          }),
        ),
      ),
    );
  }
}
