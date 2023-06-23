// Copyright 2023 Davefurn
//
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:acmc/src/model/model.dart';
import 'package:acmc/src/utils/extension/widget_extension.dart';
import 'package:acmc/src/widgets/image_loader.dart';
import 'package:acmc/src/widgets/special_button_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';
import '../features/search/search_parameters/search_details.dart';
import '../router/app_routes.dart';
import 'qrcode_widget.dart';

class Cards extends StatefulWidget {
  final SearchModel? model;
  final GuestSearchModel? guest;
  final bool showDetails;
  final VoidCallback? select;
  const Cards({
    super.key,
    required this.model,
    this.showDetails = true,
    this.select,
    this.guest,
  });

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: IdColors.backgroundColour,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 25,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 16.h,
              left: 16.h,
              right: 16.h,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/anambra.png',
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'MDA: ',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14.sp,
                                color: IdColors.textColorBlack,
                              ),
                            ),
                            TextSpan(
                              text: widget.model != null
                                  ? widget.model!.departments?.departmentName ??
                                      '****'
                                  : widget.guest!.departments.departmentName,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                color: IdColors.textColorBlack,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                8.sbW,
                Hero(
                  tag: widget.model != null
                      ? widget.model!.employeeId
                      : widget.guest!.employeeId,
                  child: SizedBox(
                    height: 99.h,
                    width: 117.w,
                    child: ImageLoader(
                      image: widget.model != null
                          ? widget.model!.profilePicture
                          : widget.guest!.profilePicture,
                      boxFit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16.h,
              right: 16.h,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                FittedBox(
                  child: Text(
                    widget.model != null
                        ? '${widget.model!.lastName} ${widget.model!.middleName} ${widget.model!.firstName}'
                        : '${widget.guest!.lastName}  ${widget.guest!.firstName}',
                    style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                ),
                4.sbH,
                FittedBox(
                  child: Text(
                    widget.model != null
                        ? widget.model!.designation?.designationName ?? '****'
                        : widget.guest!.designation.designationName,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ),
                4.sbH,
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Status: ',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: widget.model != null
                            ? widget.model!.isActive == 1
                                ? 'Valid'
                                : 'Invalid'
                            : widget.guest!.isActive
                                ? 'Valid'
                                : 'Invalid',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: widget.model != null
                              ? widget.model!.isActive == 1
                                  ? Colors.green
                                  : Colors.red
                              : widget.guest!.isActive
                                  ? Colors.green
                                  : Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                if (widget.model != null && widget.showDetails)
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        if (widget.select == null) {
                          pushTo(
                            context,
                            SearchDetails(
                              model: widget.model!,
                            ),
                          );
                        } else {
                          Navigator.of(context).pop(widget.model);
                        }
                      },
                      child: SpecialButton2(
                        text: widget.select == null
                            ? 'View all details'
                            : 'Select',
                      ),
                    ),
                  )
                else
                  30.sbH
              ],
            ),
          ),
          12.sbH,
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(12)),
            child: SizedBox(
              height: 10,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: IdColors.textColorBlack,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: IdColors.mainColor,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: IdColors.textColorBlack,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardBack extends StatelessWidget {
  final String employeeId;
  final void Function(String) onLoad;

  const CardBack({
    super.key,
    required this.employeeId,
    required this.onLoad,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: IdColors.backgroundColour,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 25,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(right: 15.w, top: 12.h),
              child: Image.asset('assets/images/anambra.png'),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: QRCodeWidget(
                employeeId: employeeId,
                width: 119.w,
                height: 121.h,
                onLoad: onLoad,
              ),
            ),
          ),
          12.sbH,
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(12)),
            child: SizedBox(
              height: 10,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: IdColors.textColorBlack,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: IdColors.mainColor,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: IdColors.textColorBlack,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
