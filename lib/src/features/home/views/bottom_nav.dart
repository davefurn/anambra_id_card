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
import 'dart:io';

import 'package:acmc/src/constants/colors.dart';
import 'package:acmc/src/features/authentication/views/login/login.dart';

import 'package:acmc/src/features/history/views/history.dart';
import 'package:acmc/src/features/home/views/homescreen.dart';
import 'package:acmc/src/features/notification/views/notification.dart';
import 'package:acmc/src/services/post_requests.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../router/app_routes.dart';
import '../../settings/views/settings_view.dart';

late BuildContext globalContext;

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with WidgetsBindingObserver {
  final List<GlobalKey<NavigatorState>> tabNavKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  int currentIndex = 0;

  AppLifecycleState? _lastLifecycleState;
  Timer? _timer;
  int kTimeoutInSeconds = 10000;

  @override
  void initState() {
    super.initState();
    globalContext = context;

    WidgetsBinding.instance.addObserver(this);
    _lastLifecycleState = WidgetsBinding.instance.lifecycleState;
    _keepAlive(false);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _timer?.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (_lastLifecycleState == AppLifecycleState.resumed &&
        state == AppLifecycleState.paused) {
      _keepAlive(true);
    } else if (_lastLifecycleState == AppLifecycleState.paused &&
        state == AppLifecycleState.resumed) {
      _keepAlive(false);
    }

    _lastLifecycleState = state;
  }

  void _keepAlive(bool visible) {
    if (visible) {
      _timer?.cancel();
    } else {
      _timer = Timer(Duration(seconds: kTimeoutInSeconds), () {
        pushToAndClearStack(context, const Login());
        PostRequest.logout();
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
              Center(
                child: Text(
                  'Logged out due to inactivity',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ],
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          activeColor: IdColors.mainColor,
          currentIndex: currentIndex,
          onTap: (value) {
            bool? canpop = tabNavKeys[value].currentState?.canPop();
            if (currentIndex == value && canpop == true) {
              tabNavKeys[value]
                  .currentState!
                  .popUntil((route) => route.isFirst);
            }
            currentIndex = value;
          },
          height: Platform.isAndroid ? 70.h : 60.h,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: IdColors.textColorGrey,
              ),
              activeIcon: Icon(
                Icons.home_outlined,
                color: IdColors.mainColor,
              ),
              label: 'Home\n',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.history,
                color: IdColors.textColorGrey,
              ),
              activeIcon: Icon(
                Icons.history,
                color: IdColors.mainColor,
              ),
              label: 'History\n',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications_none,
                  color: IdColors.textColorGrey,
                ),
                activeIcon: Icon(
                  Icons.notifications_none,
                  color: IdColors.mainColor,
                ),
                label: 'Notifications\n'),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings_outlined,
                color: IdColors.textColorGrey,
              ),
              activeIcon: Icon(
                Icons.settings_outlined,
                color: IdColors.mainColor,
              ),
              label: 'Settings\n',
            ),
          ],
        ),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                navigatorKey: tabNavKeys[0],
                builder: (context) => const CupertinoPageScaffold(
                  child: Home(),
                ),
              );
            case 1:
              return CupertinoTabView(
                navigatorKey: tabNavKeys[1],
                builder: (context) => const CupertinoPageScaffold(
                  child: History(),
                ),
              );
            case 2:
              return CupertinoTabView(
                navigatorKey: tabNavKeys[2],
                builder: (context) => const CupertinoPageScaffold(
                  child: NotificationP(),
                ),
              );
            default:
              return CupertinoTabView(
                navigatorKey: tabNavKeys[3],
                builder: (context) => const CupertinoPageScaffold(
                  child: SettingsView(),
                ),
              );
          }
        },
        // bottomNavigationBar: Theme(
        //   data: Theme.of(context).copyWith(
        //     splashColor: Colors.transparent,
        //     highlightColor: Colors.transparent,
        //   ),
        //   child: BottomNavigationBar(
        //       type: BottomNavigationBarType.fixed,
        //       onTap: (index) {
        //         ref.read(currentIndexProvider.notifier).state = index;
        //         ref.read(tabIndexProvider.notifier).state = index;
        //       },
        //       selectedLabelStyle:
        //           Theme.of(context).textTheme.bodyMedium!.copyWith(
        //                 fontWeight: FontWeight.w600,
        //                 fontSize: 12,
        //               ),
        //       unselectedLabelStyle:
        //           Theme.of(context).textTheme.bodyMedium!.copyWith(
        //                 fontWeight: FontWeight.w400,
        //                 fontSize: 12,
        //               ),
        //       currentIndex: currentIndex,
        //       elevation: 5,
        //       selectedItemColor: IdColors.mainColor,
        //       unselectedItemColor: IdColors.textColorBlack,
        //       backgroundColor: IdColors.backgroundColour,
        //       showSelectedLabels: true,
        //       showUnselectedLabels: true,
        //       items: [
        //         BottomNavigationBarItem(
        //             icon: SvgPicture.asset(
        //               'assets/svgs/home.svg',
        //               color: currentIndex == 0
        //                   ? IdColors.mainColor
        //                   : IdColors.textColorBlack,
        //             ),
        //             label: 'Home'),
        //         BottomNavigationBarItem(
        //             icon: SvgPicture.asset(
        //               'assets/svgs/history.svg',
        //               color: currentIndex == 1
        //                   ? IdColors.mainColor
        //                   : IdColors.textColorBlack,
        //             ),
        //             label: 'History'),
        //         BottomNavigationBarItem(
        //             icon: SvgPicture.asset(
        //               'assets/svgs/notification.svg',
        //               color: currentIndex == 2
        //                   ? IdColors.mainColor
        //                   : IdColors.textColorBlack,
        //             ),
        //             label: 'Notifications'),
        //         BottomNavigationBarItem(
        //             icon: SvgPicture.asset(
        //               'assets/svgs/settingsApp.svg',
        //               color: currentIndex == 3
        //                   ? IdColors.mainColor
        //                   : IdColors.textColorBlack,
        //             ),
        //             label: 'Settings'),
        //       ]),
        // ),
      ),
    );
  }
}
