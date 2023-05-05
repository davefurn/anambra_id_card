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

import 'package:acmc/src/extension/size_config.dart';
import 'package:acmc/src/features/search/search_parameters/views/search_details.dart';
import 'package:acmc/src/router/app_routes.dart';
import 'package:acmc/src/widgets/title_back_button.dart';
import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../widgets/special_button.dart';

class Searching extends StatelessWidget {
  const Searching({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    bool data = true;
    return Scaffold(
      appBar: AppBar(
        title: Text(
            textAlign:TextAlign.start,
            'Search Result',
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
                      height: getProportionateScreenHeight(4.5),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(646),
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView.builder(
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return Container(
                                width: getProportionateScreenWidth(335),
                                height: getProportionateScreenHeight(245),
                                decoration: BoxDecoration(
                                  color: IdColors.backgroundColour,
                                  border:
                                      Border.all(color: const Color(0xffBCC2CC)),
                                  borderRadius: BorderRadius.circular(14),
                                  boxShadow:  [
                                    BoxShadow(
                                      color: const Color(0xffBCC2CC).withOpacity(.1),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: const Offset(
                                          0, 4), // changes position of shadow
                                    ),
                                  ],
                                ),
                                margin: EdgeInsets.symmetric(
                                    vertical: getProportionateScreenHeight(4.5),
                                    horizontal: getProportionateScreenWidth(20)),
                                padding: EdgeInsets.symmetric(
                                    vertical: getProportionateScreenHeight(16),
                                    horizontal: getProportionateScreenWidth(16)),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Hero(
                                        tag: 'abcde',
                                        child: Container(
                                          height:
                                              getProportionateScreenHeight(99),
                                          width: getProportionateScreenWidth(117),
                                          margin: EdgeInsets.only(
                                              right: getProportionateScreenWidth(
                                                  186)),
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
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height:
                                                getProportionateScreenHeight(10),
                                          ),
                                          Text(
                                            'Chidinma Deborah Maduka',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          Text(
                                            'debbiedinma44@gmail.com',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                          ),
                                          Text(
                                            '08084646545',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                          ),
                                          GestureDetector(
                                            onTap: () => pushTo(
                                                context, const SearchDetails()),
                                            child: Container(
                                              height:
                                                  getProportionateScreenHeight(
                                                      32),
                                              width: getProportionateScreenWidth(
                                                  132),
                                              margin: EdgeInsets.only(
                                                  left:
                                                      getProportionateScreenWidth(
                                                          171)),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xffDFE5DF)),
                                                  color:
                                                      IdColors.backgroundColour,
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: Center(
                                                child: Text('View all details',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall!
                                                        .copyWith(
                                                          fontSize: 14,
                                                          color: IdColors
                                                              .textColorBlack,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        )),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ]),
                              );
                            }),
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
                    height: getProportionateScreenHeight(6),
                  ),
                  Text(
                    "No result found",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(6),
                  ),
                  GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const SpecialButton(
                        icon: Icons.search,
                        text: 'Search again',
                        width: 129,
                      )),
                ],
              )));
  }
}
