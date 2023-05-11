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
import 'package:acmc/src/widgets/special_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../extension/size_config.dart';
import '../../home/models/home_model.dart';
import 'package:collection/collection.dart';

class History extends ConsumerWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          textAlign: TextAlign.start,
          'History',
          style:
              Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 24),
          maxLines: 1,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            ref.read(currentIndexProvider.notifier).state = 0;
            ref.read(tabIndexProvider.notifier).state = 0;
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),

          Padding(
            padding: EdgeInsets.only(
              left: getProportionateScreenWidth(20),
              right: getProportionateScreenWidth(237),
            ),
            child: const SpecialButton(icon:  Icons.calendar_month, text: 'Select date', width: 118, height: 32),
          ),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          // SizedBox(
          //   width: double.maxFinite,
          //   height: getProportionateScreenHeight(529),
          //   child: MediaQuery.removePadding(
          //       context: context,
          //                 removeTop: true,
          //     child: ListView.separated(itemBuilder: (){}, separatorBuilder: {}{}, itemCount: 7),
          //                 ),
          //               )
                ],
              ),
                 );
        
  }
}
