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
import 'package:acmc/src/extension/size_config.dart';
import 'package:acmc/src/features/history/views/history.dart';
import 'package:acmc/src/features/home/views/homescreen.dart';
import 'package:acmc/src/features/notification/views/notification.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../../settings/views/settings_view.dart';
import '../models/home_model.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProvider);
    final tabIndex = ref.watch(tabIndexProvider);
    SizeConfig().init(context);
    return Scaffold(
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                ref.read(currentIndexProvider.notifier).state = index;
                ref.read(tabIndexProvider.notifier).state = index;
              },
              selectedLabelStyle:
                  Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
              unselectedLabelStyle:
                  Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
              currentIndex: currentIndex,
              elevation: 5,
              selectedItemColor: IdColors.mainColor,
              unselectedItemColor: IdColors.textColorBlack,
              backgroundColor: IdColors.backgroundColour,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              items: [
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/svgs/home.svg',
                      color: currentIndex == 0
                          ? IdColors.mainColor
                          : IdColors.textColorBlack,
                    ),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/svgs/history.svg',
                      color: currentIndex == 1
                          ? IdColors.mainColor
                          : IdColors.textColorBlack,
                    ),
                    label: 'History'),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/svgs/notification.svg',
                      color: currentIndex == 2
                          ? IdColors.mainColor
                          : IdColors.textColorBlack,
                    ),
                    label: 'Notifications'),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/svgs/settingsApp.svg',
                      color: currentIndex == 3
                          ? IdColors.mainColor
                          : IdColors.textColorBlack,
                    ),
                    label: 'Settings'),
              ]),
        ),
        body: IndexedStack(
          index: tabIndex,
          children: const [
            Home(),
            History(),
            NotificationP(),
            SettingsView(),
          ],
        ));
  }
}
