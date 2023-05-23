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

import 'package:acmc/src/features/search/search_parameters/views/search_details.dart';
import 'package:acmc/src/router/app_routes.dart';
import 'package:acmc/src/utils/extension/widget_extension.dart';
import 'package:acmc/src/widgets/special_button_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants/colors.dart';
import '../../../../widgets/special_button.dart';

class Searching extends StatefulWidget {
  const Searching({Key? key}) : super(key: key);

  @override
  State<Searching> createState() => _SearchingState();
}

class _SearchingState extends State<Searching> {
  bool data = true;

  @override
  Widget build(BuildContext context) {
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
      body: data
          ? SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "Result found",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  SizedBox(
                    height: 4.5.h,
                  ),
                  SizedBox(
                    height: 646.h,
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) {
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              'assets/images/gov_logo.png',
                                            ),
                                            const Text(
                                              'MDA: ICT Agency',
                                            )
                                          ],
                                        ),
                                        Hero(
                                          tag: 'abcde',
                                          child: Container(
                                            height: 99.h,
                                            width: 117.w,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              image: const DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/test_image.png'),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      const Text(
                                        'Chidinma Deborah Maduka',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                            color: Colors.black),
                                      ),
                                      4.sbH,
                                      const Text(
                                        'Commissioner',
                                        style: TextStyle(
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
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: InkWell(
                                          onTap: () => pushTo(
                                            context,
                                            const SearchDetails(),
                                          ),
                                          child: const SpecialButton2(
                                            text: 'View all details',
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                12.sbH,
                                ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                      bottom: Radius.circular(12)),
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
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.info_outline,
                    color: Color(0xffF97618),
                    size: 20,
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    "No result found",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const SpecialButton(
                        icon: Icons.search,
                        text: 'Search again',
                        width: 129,
                      )),
                ],
              ),
            ),
    );
  }
}
