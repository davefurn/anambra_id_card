import 'package:acmc/src/services/get_requests.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'model.dart';

final searchProvider = FutureProvider.autoDispose
    .family((_, PaginationModel pagination) => GetRequest.search(pagination));

final notificationProvider = FutureProvider.autoDispose.family(
    (_, PaginationModel pagination) => GetRequest.getNotification(pagination));
