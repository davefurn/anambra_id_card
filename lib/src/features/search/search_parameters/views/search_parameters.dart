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
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


import '../../../../extension/size_config.dart';

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
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
            textAlign:TextAlign.start,
            'Enter Parameters',
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(fontSize: 24),
                maxLines: 1,
          ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(32),
              ),
              CustomTextInput(
                onSaved: (newValue) => email = newValue,
                onChanged: (v) {},
                validator: (v) {
                  return null;
                },
                validate: _validate,
                textInputAction: TextInputAction.next,
                titleText: 'Staff ID / Phone Number / Email',
                keyboardType: TextInputType.number,
                controller: staffIdController,
                prefixIcon: Icons.email,
              ),
              SizedBox(
                height: getProportionateScreenHeight(16),
              ),
              Padding(
                padding:
                    EdgeInsets.only(right: getProportionateScreenWidth(184)),
                child: CustomTextInput(
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
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.calendar_month,
                      color: IdColors.hintTextColor,
                    ),
                    onPressed: () {},
                  ),
                  keyboardType: TextInputType.none,
                  controller: dateController,
                  prefixIcon: Icons.email,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(24),
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
        height: getProportionateScreenHeight(180),
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