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
import 'package:acmc/src/utils/extension/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmTicket extends StatefulWidget {
  const ConfirmTicket({Key? key}) : super(key: key);

  @override
  State<ConfirmTicket> createState() => _ConfirmTicketState();
}

class _ConfirmTicketState extends State<ConfirmTicket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          textAlign: TextAlign.start,
          '',
          style:
              Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 24),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            34.sbH,
            Text(
              textAlign: TextAlign.start,
              'Chidinma Deborah Maduka',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(fontSize: 24.sp, fontWeight: FontWeight.w700),
            ),
            Row(
              children: [
                Text(
                  'Visiting: ',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontSize: 16.sp, color: IdColors.textColorGrey, fontWeight: FontWeight.w600 ),
                ),
                Text(
                  'MDA',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontSize: 16.sp, color: IdColors.textColorGrey, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            24.sbH,
            Text(
              textAlign: TextAlign.start,
              'Email',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600 ),
            ),
            Text(
              'debbiedinma44@gmail.com',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(fontSize: 16.sp, color: IdColors.textColorGrey, fontWeight: FontWeight.w400),
            ),
            16.sp.sbH,
            Text(
              textAlign: TextAlign.start,
              'Phone Number',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600 ),
            ),
            Text(
              '08123457896',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(fontSize: 16.sp, color: IdColors.textColorGrey, fontWeight: FontWeight.w400),
            ),
            16.sp.sbH,
            Text(
              textAlign: TextAlign.start,
              'Date',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600 ),
            ),
            Text(
              'Wednesday 10 July, 2023',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(fontSize: 16.sp, color: IdColors.textColorGrey, fontWeight: FontWeight.w400),
            ),
            16.sp.sbH,
            Text(
              textAlign: TextAlign.start,
              'Time',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600 ),
            ),
            Text(
              '12:30PM',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(fontSize: 16.sp, color: IdColors.textColorGrey, fontWeight: FontWeight.w400),
            ),
            16.sp.sbH,
            Text(
              textAlign: TextAlign.start,
              'Reason for visit',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600 ),
            ),
            Text(
              'Consultation with the marketing team to discuss the development of a comprehensive advertising campaign for a new product launch.',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 16.sp,
                    color: IdColors.textColorGrey,
                    fontWeight: FontWeight.w400
                  ),
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}
