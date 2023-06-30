import 'dart:developer';
import 'dart:io';
import 'package:acmc/src/constants/end_points.dart';
import 'package:dio/dio.dart';

class NetworkService {
  static final Dio _dio = Dio();

  Future<Response?> postRequestHandler(String path, Map<String, dynamic>? data,
      {Options? options}) async {
    try {
      final a = await _dio.postUri(
        Uri.parse('${AppEndpoints.baseUrl}$path'),
        data: data,
        options: options,
      );
      log(a.data.toString());
      return a;
    } on DioError catch (e) {
      log(e.response.toString());
      // if (e.response?.statusCode == 401 && e.response != null) {
      // await PostRequest.refreshToken();
      // try {
      //   return await _dio.postUri(
      //     Uri.parse('${AppEndpoints.baseUrl}$path'),
      //     data: data,
      //     options: options,
      //   );
      // } catch (_) {
      //   return null;
      // }
      // } else {
      // }
      return e.response;
    } on SocketException catch (_) {
      return null;
    } catch (_) {
      return null;
    }
  }

  Future<Response?> putRequestHandler(String path, Map<String, dynamic> data,
      {Options? options}) async {
    try {
      final a = await _dio.putUri(Uri.parse('${AppEndpoints.baseUrl}$path'),
          data: data, options: options);
      log(a.data.toString());
      return a;
    } on DioError catch (e) {
      log(e.response.toString());
      // if (e.response?.statusCode == 401 && e.response != null) {
      //   await PostRequest.refreshToken();
      //   try {
      //     return await _dio.putUri(
      //       Uri.parse('${AppEndpoints.baseUrl}$path'),
      //       data: data,
      //       options: options,
      //     );
      //   } catch (_) {
      //     return null;
      //   }
      // } else {
      // }
      return e.response;
    } on SocketException catch (_) {
      return null;
    } catch (_) {
      return null;
    }
  }

  Future<Response?> getRequestHandler(String path,
      {Options? options, Map<String, dynamic>? data}) async {
    try {
      final a = await _dio.getUri(Uri.parse('${AppEndpoints.baseUrl}$path'),
          data: data, options: options);
      log(a.data.toString());
      return a;
    } on DioError catch (e) {
      log(e.response.toString());
      // if (e.response?.statusCode == 401 && e.response != null) {
      //   await PostRequest.refreshToken();
      //   try {
      //     return await _dio.getUri(
      //       Uri.parse('${AppEndpoints.baseUrl}$path'),
      //       data: data,
      //       options: options,
      //     );
      //   } catch (_) {
      //     return null;
      //   }
      // } else {
      // }
      return e.response;
    } on SocketException catch (_) {
      return null;
    } catch (_) {
      return null;
    }
  }
}
