// Copyright 2023 Davefurn
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:acmc/src/features/pagination/model.dart';
import 'package:acmc/src/features/pagination/provider.dart';
import 'package:acmc/src/model/model.dart';
import 'package:acmc/src/services/get_requests.dart';
import 'package:acmc/src/utils/extension/widget_extension.dart';
import 'package:acmc/src/widgets/special_button_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../constants/colors.dart';

class NotificationP extends ConsumerStatefulWidget {
  const NotificationP({Key? key}) : super(key: key);

  @override
  ConsumerState<NotificationP> createState() => _NotificationPState();
}

class _NotificationPState extends ConsumerState<NotificationP> {
  final PaginationModel paginationModel = PaginationModel();
  List<NotificatinModel>? value;
  late RefreshController refreshController;

  @override
  void initState() {
    super.initState();
    refreshController = RefreshController();
  }

  @override
  Widget build(BuildContext context) {
    final notificationList = ref.watch(
      notificationProvider(
        paginationModel,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          textAlign: TextAlign.start,
          'Notifications',
          style:
              Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 24),
          maxLines: 1,
        ),
        centerTitle: false,
      ),
      floatingActionButton: value != null
          ? null
          : Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: SpecialButton2(
                icon: SvgPicture.asset('assets/svgs/download.svg'),
                text: 'Clear all',
              ),
            ),
      body: notificationList.when(
        data: (val) {
          if (val?.statusCode == 200 &&
              val != null &&
              val.data['status'] == 'success' &&
              val.data['code'] == 1) {
            paginationModel.total = val.data!['data']['total'];
            if (paginationModel.page == 1) {
              value = (val.data!['data']['data'] as List)
                  .map((e) => NotificatinModel.fromJson(e))
                  .toList();
            }
            return value!.isNotEmpty
                ? Column(
                    children: [
                      Expanded(
                        child: SmartRefresher(
                          controller: refreshController,
                          enablePullUp: true,
                          physics: const ClampingScrollPhysics(),
                          onRefresh: () async {
                            value!.clear();
                            setState(() {});
                            paginationModel.page = 1;
                            paginationModel.total = 100;
                            var _ = await ref.refresh(
                                notificationProvider(paginationModel).future);
                            refreshController.refreshCompleted();
                          },
                          onLoading: () async {
                            if (value!.length != paginationModel.total) {
                              try {
                                paginationModel.page += 1;
                                final a = await GetRequest.getNotification(
                                    paginationModel);
                                var b = (a!.data!['data']['data'] as List)
                                    .map((e) => NotificatinModel.fromJson(e))
                                    .toList();
                                value!.addAll(b);
                                refreshController.loadComplete();
                                setState(() {});
                              } catch (_) {
                                refreshController.refreshFailed();
                              }
                            } else {
                              refreshController.loadNoData();
                            }
                          },
                          child: ListView.builder(
                            padding: EdgeInsets.only(
                              left: 20.w,
                              right: 20.w,
                              bottom: 100.h,
                            ),
                            itemCount: value!.length,
                            itemBuilder: (context, index) => ListTile(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1, color: IdColors.backgroundColour),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              leading: const Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.info_outline,
                                    color: IdColors.brandBlue,
                                    size: 20,
                                  ),
                                ],
                              ),
                              contentPadding: EdgeInsets.zero,
                              title: Text(
                                value![index].message,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                              ),
                              subtitle: Text(
                                value![index].title,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: IdColors.textColorBlack,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      90.sbH,
                    ],
                  )
                : Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/nothing_here.png',
                          width: 200.w,
                          height: 190.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            value = [];
                            paginationModel.page = 1;
                            paginationModel.total = 100;
                            return ref.refresh(
                              notificationProvider(paginationModel),
                            );
                          },
                          child: const SpecialButton2(
                            icon: Icon(Icons.search),
                            text: 'Search again',
                          ),
                        ),
                      ],
                    ),
                  );
          } else {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Error'),
                  SpecialButton2(
                    text: 'Retry',
                    onTap: () => ref.refresh(
                      notificationProvider(
                        paginationModel,
                      ),
                    ),
                  )
                ],
              ),
            );
          }
        },
        error: (error, trace) => const Center(
          child: Text('Error'),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}
