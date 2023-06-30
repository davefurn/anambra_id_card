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
import 'package:acmc/src/features/authentication/create_account/widget/custom_text_input.dart';
import 'package:acmc/src/features/onboarding/widgets/custom_button.dart';
import 'package:acmc/src/features/search/qr_scanner/results.dart';
import 'package:acmc/src/features/search/search_parameters/searching.dart';
import 'package:acmc/src/model/enums.dart';
import 'package:acmc/src/router/app_routes.dart';
import 'package:acmc/src/utils/extension/widget_extension.dart';
import 'package:acmc/src/widgets/search_parameter_widget.dart';
import 'package:acmc/src/widgets/special_button_2.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchParameters extends StatefulWidget {
  final bool? asGuest;
  const SearchParameters({
    super.key,
    this.asGuest,
  });

  @override
  State<SearchParameters> createState() => _SearchParametersState();
}

class _SearchParametersState extends State<SearchParameters> {
  DateTime dateTime = DateTime.now();
  String email = '';
  String phone = '';
  String id = '';
  final _formKey = GlobalKey<FormState>();
  var focus = FocusNode();

  var initialValue = SearchParameter.email;

  late TextEditingController textController;
  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  Future scanBarcode() async {
    try {
      FlutterBarcodeScanner.scanBarcode(
        "#FDB813",
        "Cancel",
        true,
        ScanMode.QR,
      ).then((value) {
        if (value != '-1') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QrCode(code: value),
            ),
          );
        }
      });
    } on PlatformException {
      //
    }
  }

  @override
  void dispose() {
    textController.dispose();
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
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: widget.asGuest == true
          ? SpecialButton2(
              onTap: scanBarcode,
              text: 'Scan Code',
              icon: SvgPicture.asset(
                'assets/svgs/scan.svg',
                color: Colors.black,
              ),
              borderColor: Colors.black,
              textColor: Colors.black,
            )
          : null,
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
                height: 90.h,
                child: GridView.count(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  crossAxisCount: 3,
                  crossAxisSpacing: 13.w,
                  childAspectRatio: 103.w / 90.h,
                  children: [
                    SearchParameterWidget(
                      family: initialValue,
                      parameter: SearchParameter.email,
                      iconData: Icons.mail_outline,
                      onTap: (p0) => setState(() {
                        initialValue = p0;
                        textController.text = email;
                        focus.unfocus();
                        // focus.requestFocus();
                      }),
                      text: 'Email Address',
                    ),
                    SearchParameterWidget(
                      family: initialValue,
                      parameter: SearchParameter.phoneNumber,
                      iconData: Icons.phone,
                      onTap: (p0) => setState(() {
                        initialValue = p0;
                        textController.text = phone;
                        focus.unfocus();
                        // focus.requestFocus();
                      }),
                      text: 'Phone number',
                    ),
                    SearchParameterWidget(
                      family: initialValue,
                      parameter: SearchParameter.staffId,
                      iconData: Icons.person_outlined,
                      onTap: (p0) => setState(() {
                        initialValue = p0;
                        textController.text = id;
                        focus.unfocus();
                        // focus.requestFocus();
                      }),
                      text: 'Staff ID',
                    ),
                  ],
                ),
              ),
              20.sbH,
              CustomTextInput(
                focusNode: focus,
                onChanged: (v) => setState(() {
                  if (initialValue == SearchParameter.email) {
                    email = v;
                  } else if (initialValue == SearchParameter.phoneNumber) {
                    phone = v;
                  } else {
                    id = v;
                  }
                }),
                titleText: initialValue == SearchParameter.email
                    ? 'Email'
                    : initialValue == SearchParameter.phoneNumber
                        ? 'Phone'
                        : 'Staff ID',
                keyboardType: initialValue == SearchParameter.email
                    ? TextInputType.emailAddress
                    : initialValue == SearchParameter.phoneNumber
                        ? TextInputType.number
                        : TextInputType.number,
                controller: textController,
                suffixIcon: Visibility(
                  visible: textController.text.isNotEmpty,
                  child: IconButton(
                      onPressed: () {
                        switch (initialValue) {
                          case SearchParameter.email:
                            email = '';
                            break;
                          case SearchParameter.phoneNumber:
                            phone = '';
                            break;
                          case SearchParameter.staffId:
                            id = '';
                            break;
                          default:
                        }
                        textController.clear();
                      },
                      icon: const Icon(Icons.clear)),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              CustomButton(
                thickLine: 1,
                onpressed: () => pushTo(
                  context,
                  Searching(
                    asGuest: widget.asGuest,
                    searchWord: textController.text,
                    identifier: initialValue == SearchParameter.email
                        ? 'email'
                        : initialValue == SearchParameter.phoneNumber
                            ? 'mobile'
                            : initialValue == SearchParameter.staffId
                                ? 'employee_id'
                                : 'mda',
                  ),
                ),
                text: 'Search Database',
                textcolor: IdColors.textColorBlack,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
