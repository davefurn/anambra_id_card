import 'package:acmc/src/model/model.dart';
import 'package:acmc/src/services/get_requests.dart';
import 'package:acmc/src/services/post_requests.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
