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
import 'package:acmc/src/widgets/card.dart';
import 'package:acmc/src/widgets/special_button_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Searching extends ConsumerStatefulWidget {
  final String searchWord;
  const Searching({
    Key? key,
    required this.searchWord,
  }) : super(key: key);

  @override
  ConsumerState<Searching> createState() => _SearchingState();
}

class _SearchingState extends ConsumerState<Searching> {
  final PaginationModel paginationModel = PaginationModel();
  late RefreshController refreshController;
  List<SearchModel> value = [];

  @override
  void initState() {
    super.initState();
    refreshController = RefreshController();
    paginationModel.word = widget.searchWord;
  }

  @override
  Widget build(BuildContext context) {
    final searchList = ref.watch(
      searchProvider(
        paginationModel,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          textAlign: TextAlign.start,
          'Search Result',
          style:
              Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 24),
          maxLines: 1,
        ),
      ),
      body: searchList.when(
        data: (val) {
          if (val != null &&
              val.data['status'] == 'success' &&
              val.data['code'] == 1) {
            paginationModel.total = val.data!['data']['total'];
            if (paginationModel.page == 1) {
              value = (val.data!['data']['data'] as List)
                  .map((e) => SearchModel.fromJson(e))
                  .toList();
            }
            return value.isNotEmpty
                ? Column(
                    children: [
                      Expanded(
                        child: SmartRefresher(
                          controller: refreshController,
                          enablePullUp: true,
                          physics: const ClampingScrollPhysics(),
                          onRefresh: () async {
                            value.clear();
                            setState(() {});
                            paginationModel.page = 1;
                            paginationModel.total = 100;
                            var _ = await ref.refresh(
                                searchProvider(paginationModel).future);
                            refreshController.refreshCompleted();
                          },
                          onLoading: () async {
                            if (value.length != paginationModel.total) {
                              try {
                                paginationModel.page += 1;
                                final a =
                                    await GetRequest.search(paginationModel);
                                var b = (a!.data!['data']['data'] as List)
                                    .map((e) => SearchModel.fromJson(e))
                                    .toList();
                                value.addAll(b);
                                refreshController.loadComplete();
                                setState(() {});
                              } catch (_) {
                                refreshController.refreshFailed();
                              }
                            } else {
                              refreshController.loadNoData();
                            }
                          },
                          child: ListView.separated(
                            itemCount: value.length,
                            itemBuilder: (context, index) {
                              return Cards(
                                model: value[index],
                              );
                            },
                            separatorBuilder: (context, index) => 20.sbH,
                          ),
                        ),
                      ),
                      90.sbH,
                    ],
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.info_outline,
                          color: Color(0xffF97618),
                          size: 20,
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          "No result found",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            value = [];
                            paginationModel.page = 1;
                            paginationModel.total = 100;
                            return ref.refresh(searchProvider(paginationModel));
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
            return const Center(
              child: Text('Error'),
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
