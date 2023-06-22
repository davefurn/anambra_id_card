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
import 'package:acmc/src/widgets/card.dart';
import 'package:acmc/src/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Searching extends ConsumerStatefulWidget {
  final String searchWord;
  final String identifier;
  final bool? asGuest;
  const Searching({
    Key? key,
    required this.searchWord,
    required this.identifier,
    this.asGuest,
  }) : super(key: key);

  @override
  ConsumerState<Searching> createState() => _SearchingState();
}

class _SearchingState extends ConsumerState<Searching> {
  final EmployeePaginationModel paginationModel = EmployeePaginationModel();

  @override
  void initState() {
    super.initState();
    paginationModel.word = widget.searchWord;
    paginationModel.identifier = widget.identifier;
    paginationModel.asGuest = widget.asGuest;
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
          if (val?.statusCode == 200 && val != null && val.data != null) {
            Map<String, dynamic> convertedMap = {};
            val.data.forEach((key, value) {
              convertedMap[key] = value;
            });

            SearchModel? newP;
            GuestSearchModel? guest;
            if (paginationModel.asGuest == true) {
              guest = GuestSearchModel.fromJson(convertedMap);
            } else {
              newP = SearchModel.fromJson(convertedMap);
            }
            return Column(
              children: [
                Cards(
                  model: newP,
                  guest: guest,
                ),
              ],
            );
          } else {
            return Center(
              child: AppErrorWidget(
                errorData: val?.data,
              ),
            );
          }
        },
        error: (error, trace) => const Center(child: AppErrorWidget()),
        loading: () => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}
