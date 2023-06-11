import 'dart:developer';

import 'package:acmc/src/features/authentication/views/create_account/create_account.dart';
import 'package:acmc/src/features/authentication/views/create_account/otp_screen.dart';
import 'package:acmc/src/features/authentication/views/create_account/password.dart';
import 'package:acmc/src/features/home/views/bottom_nav.dart';
import 'package:acmc/src/model/auth_model.dart';
import 'package:acmc/src/router/app_routes.dart';
import 'package:acmc/src/services/local_storage.dart';
import 'package:acmc/src/widgets/animation_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

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

  static Future<void> fetchBearerToken(BuildContext context,
      {required bool login, String? email, String? password}) async {
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
          print(value.statusCode);
          print(value.data);
          if (value.statusCode == 200) {
            LocalStorage.instance.setToken(value.data['data']['access_token']);
            LocalStorage.instance.setLoggedIn(true);
            if (login) {
              LoginData data = LoginData.fromJson(value.data['data']);
              LocalStorage.instance.saveUserData(data);
              ShowFlushBar.showSuccess(
                context: context,
              ).whenComplete(
                  () => pushToAndClearStack(context, const HomeScreen()));
            } else {
              ShowFlushBar.showSuccess(
                context: context,
              ).whenComplete(
                  () => pushToAndClearStack(context, const OtpScreen()));
            }
          } else {
            ShowFlushBar.showError(
              error: '${value.data["message"]}',
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
        path, {'identifier_type': "employee_id", "identifier": employeeId},
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
    log('HELLO WORLD');
    var token = (await LocalStorage.instance.getToken())!;
    network.postRequestHandler(path, {},
        options: Options(headers: {'Authorization': 'Bearer $token'}));
  }
}
