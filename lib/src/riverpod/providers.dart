import 'dart:async';

import 'package:acmc/src/constants/consts.dart';
import 'package:acmc/src/features/authentication/login/login.dart';
import 'package:acmc/src/features/home/views/bottom_nav.dart';
import 'package:acmc/src/model/model.dart';
import 'package:acmc/src/services/get_requests.dart';
import 'package:acmc/src/services/post_requests.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../router/app_routes.dart';

final activityCount = StateProvider(
    (ref) => Duration(seconds: AppConstants.logoutTime).inSeconds);

final fetchEmployeeProvider =
    FutureProvider.autoDispose((ref) => GetRequest.fetchEmployees());

final recentlySearchedProvider =
    StateProvider<List<LoginSearchedList>>((ref) => []);

final searchProvider = FutureProvider.autoDispose.family(
    (_, EmployeePaginationModel pagination) => PostRequest.search(pagination));

final notificationProvider = FutureProvider.autoDispose.family(
    (_, EmployeePaginationModel pagination) =>
        GetRequest.getNotification(pagination));
final historyProvider = FutureProvider.family(
    (_, EmployeePaginationModel pagination) =>
        GetRequest.getHistory(pagination));
final revisitProvider =
    FutureProvider.autoDispose.family((_, int id) => GetRequest.getRevisit(id));

StateNotifierProvider<AppSessionService, int> appSessionServiceProvider =
    StateNotifierProvider((ref) {
  return AppSessionService();
});

class AppSessionService extends StateNotifier<int> {
  AppSessionService() : super(0);

  void countTime() {
    state = 0;
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        state++;
        switch (state) {
          //! for 5 mins of inactivity, it would be case 300 seconds
          // 5 x 60
          case const (5 * 60):
            performlogout(globalContext);
            timer.cancel();
            state = 0;
            break;
          default:
            () {};
        }
      },
    );
  }

  //! set counter to zero
  void resetTimerState() {
    state = 0;
  }
}

void performlogout(BuildContext context) {
  pushToAndClearStack(context, const Login());
  PostRequest.logout();
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      // surfaceTintColor: Colors.white,
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
}
