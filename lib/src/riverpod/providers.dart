import 'package:acmc/src/model/model.dart';
import 'package:acmc/src/services/get_requests.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fetchEmployeeProvider =
    FutureProvider.autoDispose((ref) => GetRequest.fetchEmployees());

final recentlySearchedProvider =
    StateProvider<List<LoginSearchedList>>((ref) => []);
