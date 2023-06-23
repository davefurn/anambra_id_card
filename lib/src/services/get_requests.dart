import 'dart:math';

import 'package:acmc/src/model/model.dart';
import 'package:dio/dio.dart';

import 'local_storage.dart';
import 'network.dart';

class GetRequest {
  static final NetworkService network = NetworkService();

  static Future<List<EmployeeListModel>> fetchEmployees() async {
    var a = List.generate(
      10,
      (index) {
        final randomDuration = Duration(days: Random().nextInt(60));
        final randomDate = DateTime.now().add(randomDuration);
        return EmployeeListModel(
          email: 'gabriel@gmail.com',
          name: 'Ekene Gabriel',
          phone: '08034339010',
          date: DateTime(
            DateTime.now().year,
            randomDate.month,
            randomDate.day,
          ),
        );
      },
    );

    return await Future.delayed(const Duration(seconds: 3), () => a);
  }

  static Future<Response<dynamic>?> getNotification(
      EmployeePaginationModel pagination) async {
    var path = '/user_notifications?page=${pagination.page}';
    var token = (await LocalStorage.instance.getToken())!;
    // token =
    //     '''eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2lkbS5hbmFtYnJhc3RhdGUuZ292Lm5nL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNjg1NTQ2NTc5LCJleHAiOjE2ODU1NTAxNzksIm5iZiI6MTY4NTU0NjU3OSwianRpIjoidzN2NDFGdFg1Z2tGb3NPNCIsInN1YiI6IjIwMDYzNzI1IiwicHJ2IjoiZjY0ZDQ4YTZjZWM3YmRmYTdmYmY4OTk0NTRiNDg4YjNlNDYyNTIwYSJ9.Wa5839g8kKv7Q-zEFbxUlLUowaWchjq_ozeFVCIouHk''';
    return await network.getRequestHandler(path,
        options: Options(headers: {'Authorization': 'Bearer $token'}));
  }

  static Future<Response<dynamic>?> getHistory(
      EmployeePaginationModel pagination) async {
    // var path = '/user_activity_logs?page=${pagination.page}';
    String employeeId = await LocalStorage.instance.getStaffId();
    var path = '/search_history/user/$employeeId?page=${pagination.page}';
    var token = (await LocalStorage.instance.getToken())!;
    return await network.getRequestHandler(path,
        options: Options(headers: {'Authorization': 'Bearer $token'}));
  }

  static Future<Response<dynamic>?> getRevisit(int id) async {
    var path = '/search_history/revisit/$id';
    var token = (await LocalStorage.instance.getToken())!;
    return await network.getRequestHandler(path,
        options: Options(headers: {'Authorization': 'Bearer $token'}));
  }
}
