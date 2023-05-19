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

import 'package:acmc/src/widgets/special_button_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/colors.dart';
import '../../../extension/size_config.dart';

class NotificationP extends ConsumerStatefulWidget {
  const NotificationP({Key? key}) : super(key: key);

  @override
  ConsumerState<NotificationP> createState() => _NotificationPState();
}

class _NotificationPState extends ConsumerState<NotificationP> {
  bool noData = true;

  @override
  Widget build(BuildContext context) {
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
      floatingActionButton: noData == false
          ? null
          : Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: SpecialButton2(
                icon: SvgPicture.asset('assets/svgs/download.svg'),
                text: 'Clear all',
              ),
            ),
      body: noData
          ? ListView.builder(
              padding: EdgeInsets.only(
                left: getProportionateScreenWidth(20),
                right: getProportionateScreenWidth(20),
                bottom: getProportionateScreenHeight(100),
              ),
              itemCount: 20,
              itemBuilder: (context, index) => Material(
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                        width: 1, color: IdColors.backgroundColour),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  leading:  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:const [
                      Icon(
                        Icons.info_outline,
                        color: IdColors.brandBlue,
                        size: 20,
                      ),
                    ],
                  ),
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Your data has been updated on national database. ',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  subtitle: Text(
                    'Tap to view update',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: IdColors.textColorBlack),
                  ),
                ),
              ),
            )
          : Center(
              child: Image.asset(
                'assets/images/nothing_here.png',
                width: getProportionateScreenWidth(200),
                height: getProportionateScreenHeight(190),
              ),
            ),
    );
  }
}
