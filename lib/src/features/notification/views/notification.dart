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

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/colors.dart';
import '../../../extension/size_config.dart';
import '../../../widgets/special_button.dart';
import '../../../widgets/title_back_button.dart';
import '../../home/models/home_model.dart';

class NotificationP extends ConsumerWidget {
  const NotificationP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //   final bottomSelectedItem = ref.watch(currentIndexProvider);
    // final tabIndexValue = ref.watch(tabIndexProvider);
    bool noData = true;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          textAlign: TextAlign.start,
          'Notification',
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
      body: noData
          ? SingleChildScrollView(
              child: Stack(children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(719),
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 20,
                          itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.only(
                              left: getProportionateScreenWidth(20),
                              right: getProportionateScreenWidth(20),
                              bottom: getProportionateScreenHeight(8),
                              top: getProportionateScreenHeight(0),
                            ),
                            child: Material(
                              child: ListTile(
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 1,
                                      color: IdColors.backgroundColour),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                visualDensity:
                                    const VisualDensity(vertical: -4),
                                dense: true,
                                minLeadingWidth:
                                    getProportionateScreenWidth(12),
                                leading: Padding(
                                  padding: EdgeInsets.only(
                                      top: getProportionateScreenHeight(8)),
                                  child: const Icon(
                                    Icons.info_outline,
                                    color: IdColors.brandBlue,
                                    size: 20,
                                  ),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: getProportionateScreenHeight(12),
                                    horizontal: getProportionateScreenWidth(0)),
                                title: Text(
                                  'Your data has been updated on national database. ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                ),
                                subtitle: Text(
                                  'Tap to view update',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: IdColors.textColorBlack),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: getProportionateScreenHeight(685),
                      right: getProportionateScreenWidth(20),
                      left: getProportionateScreenWidth(239),
                      bottom: getProportionateScreenHeight(95)),
                  child: const SpecialButton(
                    icon: Icons.delete_forever_outlined,
                    text: 'Clear all',
                  ),
                ),
              ]),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleWithBackButton(
                  text: 'Notification',
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: getProportionateScreenHeight(215),
                      bottom: getProportionateScreenHeight(234),
                      left: getProportionateScreenWidth(89)),
                  child: Image.asset(
                    'assets/images/nothing_here.png',
                    width: getProportionateScreenWidth(200),
                    height: getProportionateScreenHeight(190),
                  ),
                ),
              ],
            ),
    );
  }
}
