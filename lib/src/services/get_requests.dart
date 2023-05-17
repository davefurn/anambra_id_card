import 'dart:math';

import 'package:acmc/src/model/model.dart';

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
}
