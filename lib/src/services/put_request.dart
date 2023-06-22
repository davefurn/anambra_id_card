import 'package:acmc/src/services/local_storage.dart';
import 'package:dio/dio.dart';

import 'network.dart';

class PutRequest {
  static final NetworkService network = NetworkService();

  static Future<Response<dynamic>?> resetPassword(
      Map<String, dynamic> data) async {
    var userId = await LocalStorage.instance.getStaffId();
    var path = '/users/$userId/password';
    var token = (await LocalStorage.instance.getToken())!;
    return await network.putRequestHandler(path, data,
        options: Options(headers: {'Authorization': 'Bearer $token'}));
  }
}
