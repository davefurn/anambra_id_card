import 'package:acmc/src/services/get_requests.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fetchEmployeeProvider =
    FutureProvider.autoDispose((ref) => GetRequest.fetchEmployees());
