import 'dart:math';

import 'package:acmc/src/features/pagination/model.dart';
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

  static Future<Response<dynamic>?> search(PaginationModel pagination) async {
    var path = '/employee_data/search/${pagination.word}?page=${pagination.page}';
    var token = (await LocalStorage.instance.getToken())!;
    token =
        '''eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2lkbS5hbmFtYnJhc3RhdGUuZ292Lm5nL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNjg1NTM5MjQ2LCJleHAiOjE2ODU1NDI4NDYsIm5iZiI6MTY4NTUzOTI0NiwianRpIjoiaFF6ZmNCT2M5aVJneDl1ZiIsInN1YiI6IjIwMDYzNzI1IiwicHJ2IjoiZjY0ZDQ4YTZjZWM3YmRmYTdmYmY4OTk0NTRiNDg4YjNlNDYyNTIwYSJ9.rO8PW2vT-kYienuf9eszs0phcthRPLU60GdZa3N7X3c''';
    return await network.getRequestHandler(path,
        options: Options(headers: {'Authorization': 'Bearer $token'}));
  }
}
