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
import 'package:acmc/src/features/authentication/views/create_account/widget/custom_text_input.dart';
import 'package:acmc/src/features/search/search_parameters/views/searching.dart';
import 'package:acmc/src/model/enums.dart';
import 'package:acmc/src/utils/extension/widget_extension.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../router/app_routes.dart';
import '../../../../utils/date_time_util.dart';
import '../../../onboarding/widgets/custom_button.dart';

class SearchParameters extends StatefulWidget {
  const SearchParameters({super.key});

  @override
  State<SearchParameters> createState() => _SearchParametersState();
}

class _SearchParametersState extends State<SearchParameters> {
  DateTime dateTime = DateTime.now();
  String? email;
  String? password;
  final _formKey = GlobalKey<FormState>();

  var initialValue = SearchParameter.email;

  final bool _validate = false;
  late TextEditingController staffIdController;
  late TextEditingController dateController;
  @override
  void initState() {
    super.initState();
    dateController = TextEditingController();
    staffIdController = TextEditingController();
  }

  @override
  void dispose() {
    staffIdController.dispose();
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          textAlign: TextAlign.start,
          'Enter Parameters',
          style:
              Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 24),
          maxLines: 1,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              32.sbH,
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    'Select what information you’re searching with.',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
              16.sbH,
              SizedBox(
                height: 82.h,
                child: GridView.count(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  crossAxisCount: 3,
                  crossAxisSpacing: 13.w,
                  childAspectRatio: 103.w / 82.h,
                  children: [
                    InkWell(
                      onTap: () =>
                          setState(() => initialValue = SearchParameter.email),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: initialValue == SearchParameter.email
                              ? IdColors.fadedMainColor
                              : Colors.transparent,
                          border: Border.all(
                            color: initialValue == SearchParameter.email
                                ? IdColors.mainColor
                                : IdColors.grey,
                          ),
                        ),
                        padding: EdgeInsets.all(10.r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(
                              Icons.mail_outline,
                            ),
                            Text(
                              'Email Address',
                              maxLines: 2,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => setState(
                          () => initialValue = SearchParameter.phoneNumber),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: initialValue == SearchParameter.phoneNumber
                              ? IdColors.fadedMainColor
                              : Colors.transparent,
                          border: Border.all(
                            color: initialValue == SearchParameter.phoneNumber
                                ? IdColors.mainColor
                                : IdColors.grey,
                          ),
                        ),
                        padding: EdgeInsets.all(10.r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(
                              Icons.phone,
                            ),
                            Text(
                              'Phone Number',
                              maxLines: 2,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => setState(
                          () => initialValue = SearchParameter.staffId),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: initialValue == SearchParameter.staffId
                              ? IdColors.fadedMainColor
                              : Colors.transparent,
                          border: Border.all(
                            color: initialValue == SearchParameter.staffId
                                ? IdColors.mainColor
                                : IdColors.grey,
                          ),
                        ),
                        padding: EdgeInsets.all(10.r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(
                              Icons.person_outlined,
                            ),
                            Text(
                              'Staff ID',
                              maxLines: 2,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              20.sbH,
              CustomTextInput(
                onSaved: (newValue) => email = newValue,
                onChanged: (v) {},
                validator: (v) {
                  return null;
                },
                validate: _validate,
                textInputAction: TextInputAction.next,
                titleText: initialValue == SearchParameter.email
                    ? 'Email'
                    : initialValue == SearchParameter.phoneNumber
                        ? 'Phone'
                        : 'Staff ID',
                keyboardType: initialValue == SearchParameter.email
                    ? TextInputType.emailAddress
                    : initialValue == SearchParameter.phoneNumber
                        ? TextInputType.number
                        : TextInputType.text,
                controller: staffIdController,
                prefixIcon: Icons.email,
              ),
              SizedBox(
                height: 16.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomTextInput(
                  readOnly: true,
                  width: 210.w,
                  onTap: () => Utils.showSheet(context,
                      child: buildDatePicker(), onClicked: () {
                    FocusScope.of(context).requestFocus(FocusNode());

                    final value = DateFormat('yyyy/MM/dd').format(dateTime);
                    dateController.text = value;

                    Navigator.pop(context);
                  }),
                  onSaved: (newValue) => email = newValue,
                  onChanged: (v) {},
                  validator: (v) {
                    if (v!.isEmpty || v.isEmpty) {
                      return 'Choose Date';
                    }
                    return null;
                  },
                  validate: _validate,
                  textInputAction: TextInputAction.next,
                  titleText: 'Date of birth',
                  hintText: "dd/mm/yyyy",
                  suffixIcon: const Icon(
                    Icons.calendar_month,
                    color: IdColors.hintTextColor,
                  ),
                  keyboardType: TextInputType.none,
                  controller: dateController,
                  prefixIcon: Icons.email,
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              CustomButton(
                thickLine: 1,
                onpressed: () {
                  pushTo(context, const Searching());
                },
                text: 'Search Database',
                textcolor: IdColors.textColorBlack,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDatePicker() => SizedBox(
        height: 180.h,
        child: CupertinoDatePicker(
          minimumYear: 1900,
          maximumYear: DateTime.now().year,
          initialDateTime: dateTime,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (dateTime) =>
              setState(() => this.dateTime = dateTime),
        ),
      );
}
