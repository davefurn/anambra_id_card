import 'dart:developer';

import 'package:acmc/src/features/authentication/views/create_account/create_account.dart';
import 'package:acmc/src/features/authentication/views/create_account/otp_screen.dart';
import 'package:acmc/src/features/authentication/views/create_account/password.dart';
import 'package:acmc/src/features/home/views/bottom_nav.dart';
import 'package:acmc/src/features/pagination/model.dart';
import 'package:acmc/src/model/auth_model.dart';
import 'package:acmc/src/model/model.dart';
import 'package:acmc/src/riverpod/providers.dart';
import 'package:acmc/src/router/app_routes.dart';
import 'package:acmc/src/services/local_storage.dart';
import 'package:acmc/src/widgets/animation_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'flush.dart';
import 'network.dart';

class PostRequest {
  static final NetworkService network = NetworkService();

  static Future<void> register(
      Map<String, String> data, BuildContext context) async {
    const path = '/register';

    await network.postRequestHandler(path, data).then(
      (value) async {
        if (value != null) {
          if (value.statusCode == 200) {
            LocalStorage.instance.setEmail(data['email']!);
            LocalStorage.instance.setPhone(data['mobile_number']!);
            ShowFlushBar.showSuccess(
              message: value.data["user_message"],
              context: context,
              duration: const Duration(milliseconds: 700),
            ).then((value) => pushTo(context, const AnimationScreen()));
          } else {
            ShowFlushBar.showError(
              error: '${value.data["message"]}',
              context: context,
            );
          }
        } else {
          ShowFlushBar.showError(
            context: context,
          );
        }
      },
    );
  }

  static Future<void> verifyOtp(
      Map<String, String> data, BuildContext context) async {
    const path = '/verify-otp';
    var mobile = (await LocalStorage.instance.getPhone())!;
    // var email = (await LocalStorage.instance.getEmail())!;
    var token = (await LocalStorage.instance.getToken())!;
    // email = 'DORATHY.ABASILIM@anambrastate.gov.ng'; // Remove later
    data['mobile_number'] = mobile;
    // data['email'] = email;

    await network
        .postRequestHandler(path, data,
            options: Options(headers: {'Authorization': 'Bearer $token'}))
        .then(
      (value) async {
        if (value != null) {
          if (value.statusCode == 200 && value.data["status"] == "success") {
            ShowFlushBar.showSuccess(
              message: value.data["message"],
              context: context,
              duration: const Duration(milliseconds: 700),
            ).then((val) => pushReplacementTo(
                context,
                VerifyDetails(
                  data: VerifiedUserData.fromJson(value.data['user']),
                )));
          } else {
            ShowFlushBar.showError(
              error: value.data["message"],
              context: context,
            );
          }
        } else {
          ShowFlushBar.showError(
            context: context,
          );
        }
      },
    );
  }

  static Future<void> fetchBearerToken(
    BuildContext context, {
    required bool login,
    String? email,
    String? password,
    required WidgetRef ref,
  }) async {
    const path = '/login';

    if (email == null) {
      email = (await LocalStorage.instance.getEmail())!;
      password = (await LocalStorage.instance.getPhone())!;
    }

    // email = 'gentzycode@live.com'; //Remove later
    // phone = '08063712294'; //Remove later

    await network
        .postRequestHandler(path, {'email': email, 'password': password}).then(
      (value) async {
        if (value != null) {
          if (value.statusCode == 200) {
            LocalStorage.instance.setToken(value.data['data']['access_token']);
            LocalStorage.instance.setLoggedIn(true);
            if (login) {
              LoginData data = LoginData.fromJson(value.data['data']);
              List<LoginSearchedList> search =
                  (value.data['data']['recent_searches'] as List)
                      .map((e) => LoginSearchedList.fromJson(e))
                      .toList();
              LocalStorage.instance.saveUserData(data);
              ref.read(recentlySearchedProvider.notifier).state = search;
              ShowFlushBar.showSuccess(
                context: context,
              ).whenComplete(
                () => pushToAndClearStack(context, const HomeScreen()),
              );
            } else {
              ShowFlushBar.showSuccess(
                context: context,
              ).whenComplete(
                  () => pushToAndClearStack(context, const OtpScreen()));
            }
          } else {
            late String message;
            try {
              message = '${value.data["message"]}';
              log('CRITICAL LOG');
            } catch (_) {
              message = 'Something went wrong';
            }

            ShowFlushBar.showError(
              error: message,
              context: context,
            ).whenComplete(() {
              if (email == null) {
                return pushReplacementTo(context, const CreateAccount());
              } else {
                if (!login) {
                  pop(context);
                }
              }
            });
          }
        } else {
          ShowFlushBar.showError(
            context: context,
          );
        }
      },
    );
  }

  static Future<Response<dynamic>?> generateQRCode(String employeeId) async {
    var path = '/employee_data/generate_qr_code';
    var token = (await LocalStorage.instance.getToken())!;

    return await network.postRequestHandler(
        path,
        {
          'identifier_type': "employee_id",
          "identifier": employeeId,
          "purpose": "employee_verification",
        },
        options: Options(headers: {'Authorization': 'Bearer $token'}));
  }

  static Future<Response<dynamic>?> logout() async {
    var path = '/logout';
    var token = (await LocalStorage.instance.getToken())!;
    return await network.postRequestHandler(path, {},
        options: Options(headers: {'Authorization': 'Bearer $token'}));
  }

  static Future<void> refreshToken() async {
    var path = '/refresh';
    var token = (await LocalStorage.instance.getToken())!;
    network.postRequestHandler(path, {},
        options: Options(headers: {'Authorization': 'Bearer $token'}));
  }

  static Future<Response<dynamic>?> search(
      EmployeePaginationModel pagination) async {
    var path = '/employee_data/advancedsearch';
    if (pagination.asGuest == true) {
      path = '/guest-search';
    }
    var token = (await LocalStorage.instance.getToken())!;
    var staffId = (await LocalStorage.instance.getStaffId());
    // token =
    //     '''eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2lkbS5hbmFtYnJhc3RhdGUuZ292Lm5nL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNjg1NTUxNDg2LCJleHAiOjE2ODU1NTUwODYsIm5iZiI6MTY4NTU1MTQ4NiwianRpIjoiY3BoY3VTNE9xN1RhSVJnMyIsInN1YiI6IjIwMDYzNzI1IiwicHJ2IjoiZjY0ZDQ4YTZjZWM3YmRmYTdmYmY4OTk0NTRiNDg4YjNlNDYyNTIwYSJ9.fBwB3kVVuLpIaXOGcH3Nq8yw7Cko2bLwHjqZuPXCBkY''';

    var data = {
      "identifier": pagination.identifier,
      "value": pagination.word,
    };
    if (pagination.asGuest == true) {
      data.addAll({"user_type": "Guest"});
    } else {
      data.addAll({"user_id": staffId});
    }
    return await network.postRequestHandler(
      path,
      data,
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
  }
}
