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

import 'package:acmc/src/utils/extension/widget_extension.dart';
import 'package:acmc/src/widgets/special_button_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';
import '../features/search/search_parameters/views/search_details.dart';
import '../router/app_routes.dart';

class Cards extends StatelessWidget {
  final String text;
  final String logo;
  final String image;
  final String name;
  final String department;
  final bool showDetails;
  const Cards({
    super.key,
    required this.text,
    required this.logo,
    required this.image,
    required this.name,
    required this.department,
    this.showDetails = true,
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
          Padding(
            padding: EdgeInsets.only(
              top: 16.h,
              left: 16.h,
              right: 16.h,
            ),
            child: SizedBox(
              height: 90.h,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        logo,
                      ),
                      Text(
                        text,
                      )
                    ],
                  ),
                  Hero(
                    tag: 'abcde',
                    child: Container(
                      height: 99.h,
                      width: 117.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage(image),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
                Text(
                  name,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.black),
                ),
                4.sbH,
                Text(
                  department,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                4.sbH,
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Status: ',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'Active',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
                if (showDetails)
                  Align(
                    alignment: Alignment.centerRight,
                    child: Hero(
                      tag: 1,
                      child: InkWell(
                        onTap: () => pushTo(
                          context,
                          const SearchDetails(),
                        ),
                        child: const SpecialButton2(
                          text: 'View all details',
                        ),
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
                      color: IdColors.mainColor,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: IdColors.blue,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: IdColors.mainColor,
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
