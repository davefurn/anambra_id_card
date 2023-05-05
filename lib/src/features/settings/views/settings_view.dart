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
import 'package:acmc/src/features/feedback/views/suggest_improvement.dart';
import 'package:flutter/material.dart';

import '../../../extension/size_config.dart';
import '../../../router/app_routes.dart';

import '../../home/models/home_model.dart';
import '../../profile/views/profile.dart';
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            ref.read(currentIndexProvider.notifier).state = 0;
            ref.read(tabIndexProvider.notifier).state = 0;
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(350),
              width: getProportionateScreenWidth(173),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    children: [
                      ListTile(
                        onTap: () {
                          pushTo(context, const Profile());
                        },
                        minLeadingWidth: getProportionateScreenWidth(22.57),
                        horizontalTitleGap: 18,
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
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
                            fontWeight: FontWeight.w700,
                            color: IdColors.textColorBlack,
                          ),
                        ),
                        iconColor: IdColors.textColorGrey,
                      ),
                      ListTile(
                        onTap: () {},
                        minLeadingWidth: getProportionateScreenWidth(22.57),
                        horizontalTitleGap: 18,
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
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
                            fontWeight: FontWeight.w700,
                            color: IdColors.textColorBlack,
                          ),
                        ),
                        iconColor: IdColors.textColorGrey,
                      ),
                      ListTile(
                        onTap: () {
                          pushTo(context, const SuggestImprovement());
                        },
                        minLeadingWidth: getProportionateScreenWidth(22.57),
                        horizontalTitleGap: 18,
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
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
                            fontWeight: FontWeight.w700,
                            color: IdColors.textColorBlack,
                          ),
                        ),
                        iconColor: IdColors.textColorGrey,
                      ),
                      ListTile(
                        onTap: () {
                          
                        },
                        minLeadingWidth: getProportionateScreenWidth(22.57),
                        horizontalTitleGap: 18,
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
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
                            fontWeight: FontWeight.w700,
                            color: IdColors.textColorBlack,
                          ),
                        ),
                        iconColor: IdColors.textColorGrey,
                      ),
                      ListTile(
                        onTap: () {},
                        minLeadingWidth: getProportionateScreenWidth(22.57),
                        horizontalTitleGap: 18,
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
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
                            fontWeight: FontWeight.w700,
                            color: IdColors.textColorBlack,
                          ),
                        ),
                        iconColor: IdColors.textColorGrey,
                      ),
                      ListTile(
                        onTap: () {},
                        minLeadingWidth: getProportionateScreenWidth(22.57),
                        horizontalTitleGap: 18,
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
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
                            fontWeight: FontWeight.w700,
                            color: IdColors.failureColor,
                          ),
                        ),
                        iconColor: IdColors.textColorGrey,
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
