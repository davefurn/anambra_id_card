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

import 'dart:io';

import 'package:acmc/src/constants/colors.dart';
import 'package:acmc/src/features/authentication/login/login.dart';
import 'package:acmc/src/features/settings/change_password.dart';
import 'package:acmc/src/model/enums.dart';
import 'package:acmc/src/services/flush.dart';
import 'package:acmc/src/services/post_requests.dart';
import 'package:acmc/src/utils/extension/widget_extension.dart';
import 'package:acmc/src/widgets/animation_screen.dart';
import 'package:acmc/src/widgets/special_button_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../router/app_routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsView extends ConsumerWidget {
  const SettingsView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          textAlign: TextAlign.start,
          'Settings',
          style:
              Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 24),
          maxLines: 1,
        ),
        centerTitle: false,
      ),
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          ListTile(
            onTap: () => pushTo(
                context,
                const AnimationScreen(
                  loadingOption: LoadingOption.profile,
                )),
            horizontalTitleGap: 18,
            leading: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.person_outline,
                  size: 26,
                ),
              ],
            ),
            title: const Text(
              "Profile",
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: IdColors.textColorBlack,
              ),
            ),
            iconColor: IdColors.textColorGrey,
          ),
          ListTile(
            onTap: () => pushTo(context, const ChangePassword()),
            horizontalTitleGap: 18,
            leading: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.history,
                  size: 26,
                ),
              ],
            ),
            title: const Text(
              "Change password",
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: IdColors.textColorBlack,
              ),
            ),
            iconColor: IdColors.textColorGrey,
          ),
          ListTile(
            // onTap: () => pushTo(context, const SuggestImprovement()),
            onTap: () => ShowFlushBar.showSuccess(
                context: context, message: 'Not Enabled.'),
            horizontalTitleGap: 18,
            leading: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.chat_outlined,
                  size: 26,
                ),
              ],
            ),
            title: const Text(
              "Send feedback",
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: IdColors.textColorBlack,
              ),
            ),
            iconColor: IdColors.textColorGrey,
          ),
          ListTile(
            onTap: () => ShowFlushBar.showSuccess(
                context: context, message: 'Not Enabled.'),
            horizontalTitleGap: 18,
            leading: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.star_outline,
                  size: 26,
                ),
              ],
            ),
            title: const Text(
              "Privacy Policy",
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: IdColors.textColorBlack,
              ),
            ),
            iconColor: IdColors.textColorGrey,
          ),
          ListTile(
            onTap: () async {
              var platform = Platform.isAndroid ? 'Android' : 'Ios';
              PackageInfo.fromPlatform().then((value) {
                String version = value.version;
                showDialog(
                  context: context,
                  builder: (context) => SimpleDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    insetPadding: const EdgeInsets.symmetric(horizontal: 20),
                    contentPadding: const EdgeInsets.all(16),
                    children: [
                      Text(
                        'Current app is version $version',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color(
                            0xff010C20,
                          ),
                        ),
                      ),
                      Text(
                        'For $platform OS, designed with Flutter.',
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(
                            0xff010C20,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              });
            },
            horizontalTitleGap: 18,
            leading: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.phone_android_outlined,
                  size: 26,
                ),
              ],
            ),
            title: const Text(
              "App version",
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: IdColors.textColorBlack,
              ),
            ),
            iconColor: IdColors.textColorGrey,
          ),
          ListTile(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => SimpleDialog(
                  surfaceTintColor: Colors.white,
                  contentPadding: EdgeInsets.all(20.r),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  title: SvgPicture.asset(
                    'assets/svgs/info_big.svg',
                    color: const Color(0xff0E5CE3),
                    width: 34.r,
                    height: 34.r,
                  ),
                  children: [
                    Text(
                      'Are you sure you want to logout',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                      ),
                    ),
                    24.sbH,
                    Row(
                      children: [
                        Expanded(
                          child: SpecialButton2(
                            text: 'No',
                            height: 40.h,
                            onTap: () => pop(context),
                            backgroundColor: Colors.transparent,
                            borderColor: IdColors.grey,
                            textColor: Colors.black,
                          ),
                        ),
                        10.sbW,
                        Expanded(
                          child: SpecialButton2(
                            onTap: () {
                              pushToAndClearStack(context, const Login());
                              PostRequest.logout();
                            },
                            height: 40.h,
                            text: 'Yes',
                            backgroundColor: IdColors.mainColor,
                            borderColor: Colors.transparent,
                            textColor: Colors.black,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
            horizontalTitleGap: 18,
            leading: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.logout_outlined,
                  size: 26,
                  color: IdColors.failureColor,
                ),
              ],
            ),
            title: const Text(
              "Logout",
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: IdColors.failureColor,
              ),
            ),
            iconColor: IdColors.textColorGrey,
          ),
        ],
      ),
    );
  }
}
