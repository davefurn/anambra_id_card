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

import 'package:acmc/src/constants/colors.dart';
import 'package:acmc/src/features/all_employees/widget/employee_tile.dart';
import 'package:acmc/src/features/pagination/model.dart';
import 'package:acmc/src/features/pagination/provider.dart';
import 'package:acmc/src/model/model.dart';
import 'package:acmc/src/services/get_requests.dart';
import 'package:acmc/src/utils/extension/widget_extension.dart';
import 'package:acmc/src/widgets/error_widget.dart';
import 'package:acmc/src/widgets/special_button_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class History extends ConsumerStatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  ConsumerState<History> createState() => _HistoryState();
}

class _HistoryState extends ConsumerState<History> {
  final EmployeePaginationModel paginationModel = EmployeePaginationModel();
  List<EmployeeListModel>? value;
  late RefreshController refreshController;

  @override
  void initState() {
    super.initState();
    refreshController = RefreshController();
  }

  @override
  Widget build(BuildContext context) {
    var employee = ref.watch(historyProvider(
      paginationModel,
    ));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          textAlign: TextAlign.start,
          'History',
          style:
              Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 24),
          maxLines: 1,
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          // SizedBox(
          //   height: 20.h,
          // ),
          // Padding(
          //   padding: EdgeInsets.only(
          //     left: 20.w,
          //     right: 237.w,
          //   ),
          //   child: const SpecialButton(
          //       icon: Icons.calendar_month,
          //       text: 'Select date',
          //       width: 118,
          //       height: 32),
          // ),
          // SizedBox(
          //   height: 10.h,
          // ),
          Expanded(
            child: employee.when(
              data: (data) {
                if (data?.statusCode == 200 &&
                    data != null &&
                    data.data['status'] == 'success' &&
                    data.data['code'] == 1) {
                  paginationModel.total = data.data!['data']['total'];
                  if (paginationModel.page == 1) {
                    value = (data.data!['data']['data'] as List)
                        .map((e) => EmployeeListModel.fromJson(e))
                        .toList();
                  }
                  return SmartRefresher(
                    controller: refreshController,
                    enablePullUp: true,
                    physics: const ClampingScrollPhysics(),
                    onRefresh: () async {
                      value!.clear();
                      setState(() {});
                      paginationModel.page = 1;
                      paginationModel.total = 100;
                      var _ = await ref
                          .refresh(historyProvider(paginationModel).future);
                      refreshController.refreshCompleted();
                    },
                    onLoading: () async {
                      if (value!.length != paginationModel.total) {
                        try {
                          paginationModel.page += 1;
                          final a =
                              await GetRequest.getHistory(paginationModel);
                          var b = (a!.data!['data']['data'] as List)
                              .map((e) => EmployeeListModel.fromJson(e))
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
                    child: GroupedListView<EmployeeListModel, DateTime>(
                      padding: EdgeInsets.only(
                        left: 20.w,
                        right: 20.w,
                        bottom: 100.h,
                        // top: 21.h,
                      ),
                      elements: value!,
                      groupBy: (element) => element.date,
                      groupSeparatorBuilder: (DateTime groupByValue) => Column(
                        children: [
                          18.sbH,
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              DateFormat('dd MMM yyyy').format(groupByValue),
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Color(0xff5E6166),
                              ),
                            ),
                          ),
                          18.sbH,
                        ],
                      ),
                      itemBuilder: (context, EmployeeListModel element) =>
                          Column(
                        children: [
                          EmployeeTile(data: element),
                          8.sbH,
                          const Divider(
                            color: IdColors.textColorGrey,
                            thickness: 1,
                            height: 20,
                          )
                        ],
                      ),
                    ),
                  );
                } else {
                  return Center(
                    child: AppErrorWidget(
                      // errorData: data?.data['data'],
                      errorData: data?.data,
                      retry: SpecialButton2(
                        text: 'Retry',
                        onTap: () => ref.refresh(
                          historyProvider(
                            paginationModel,
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
              error: (error, trace) => Center(
                child: AppErrorWidget(
                  error: error,
                  retry: SpecialButton2(
                    text: 'Retry',
                    onTap: () => ref.refresh(
                      historyProvider(
                        paginationModel,
                      ),
                    ),
                  ),
                ),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: IdColors.mainColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
