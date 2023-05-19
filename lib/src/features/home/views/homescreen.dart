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
import 'package:acmc/src/extension/size_config.dart';
import 'package:acmc/src/features/all_employees/views/all_employees.dart';
import 'package:acmc/src/features/home/views/widgets/query_container.dart';
import 'package:acmc/src/features/search/search_parameters/views/search_parameters.dart';
import 'package:acmc/src/features/statistics/view/view.dart';
import 'package:acmc/src/router/app_routes.dart';
import 'package:acmc/src/utils/extension/widget_extension.dart';
import 'package:acmc/src/widgets/special_button_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../../search/qr_scanner/views/failed_screen.dart';
import '../../search/qr_scanner/views/results.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future scanBarcode() async {
    String? scanResult;
    try {
      scanResult = await FlutterBarcodeScanner.scanBarcode(
        "#FDB813",
        "Cancel",
        true,
        ScanMode.QR,
      );
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QrCode(code: scanResult!),
        ),
      );
    } on PlatformException {
      scanResult = "Failed to get platform version";
      pushTo(context, const FailedScan());
    }
    if (!mounted) {}
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            top: getProportionateScreenHeight(80)),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: IdColors.mainColor,
                        ),
                  ),
                  Text(
                    'Managing Director',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: IdColors.textColorBlack,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(4),
                  ),
                  Text(
                    'Ict Agency',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: IdColors.textColorBlack,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(32),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.info_outline,
                    color: IdColors.otpGrey,
                    size: 13.33,
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(5.33),
                  ),
                  Text(
                    'You can only search for those within your MDA',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: IdColors.otpGrey,
                        ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(4),
            ),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              childAspectRatio: getProportionateScreenHeight(160) /
                  getProportionateScreenHeight(144),
              crossAxisSpacing: getProportionateScreenWidth(16),
              padding: EdgeInsets.only(
                right: getProportionateScreenWidth(20),
              ),
              children: [
                InkWell(
                  onTap: () {
                    pushTo(context, const SearchParameters());
                  },
                  child: const QueryContainer(
                    colors: [
                      Color(0xffF3CA39),
                      Color(0xffE0523F),
                    ],
                    description: 'Manually search\ndatabase with inputs',
                    svgAsset: 'assets/svgs/search.svg',
                    svgAssetText: 'Search',
                  ),
                ),
                InkWell(
                  onTap: scanBarcode,
                  child: const QueryContainer(
                    colors: [
                      Color(0xff63DBE2),
                      Color(0xff2E7CC3),
                    ],
                    description: 'Use your camera to capture the QR code ',
                    svgAsset: 'assets/svgs/scan_qr.svg',
                    svgAssetText: 'Scan QR code',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(26),
            ),
            Padding(
              padding: EdgeInsets.only(right: getProportionateScreenWidth(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recently searched',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: IdColors.textColorGrey,
                        ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(5.73),
                  ),
                  Row(
                    children: [
                      Text(
                        'More',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: IdColors.textColorGrey,
                            ),
                      ),
                      8.sbW,
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 10,
                        color: IdColors.textColorYellow,
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            SizedBox(
               height: getProportionateScreenHeight(90),
                
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: IdColors.mainGrey,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        margin: EdgeInsets.only(
                            right: getProportionateScreenWidth(8)),
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(16),
                          vertical: getProportionateScreenHeight(8),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'James Nganhjsdhsfefd feer`',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              'Jamesngannou@gmail.com.uk.`',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: IdColors.textColorGrey),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              children: [
                                Text(
                                  'status: ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: IdColors.textColorGrey),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  'active',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: IdColors.failureColor),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(26),
            ),
            Padding(
              padding: EdgeInsets.only(right: getProportionateScreenWidth(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Statistics',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: IdColors.textColorGrey,
                        ),
                  ),
                  InkWell(
                    onTap: () => pushTo(context, const StatisticsView()),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'More',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: IdColors.textColorGrey,
                                  ),
                        ),
                        4.sbW,
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 10,
                          color: IdColors.textColorYellow,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            SizedBox(
               height: getProportionateScreenHeight(60),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: IdColors.mainGrey,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        margin: EdgeInsets.only(
                            right: getProportionateScreenWidth(4)),
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(12),
                          vertical: getProportionateScreenHeight(6),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Active',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const Text('data'),
                          ],
                        ),
                      );
                    }),
              ),
            ),
            
            SizedBox(
              height: getProportionateScreenHeight(40.5),
            ),
            Center(
              child: InkWell(
                onTap: () => pushTo(
                  context,
                  const AllEmployee(),
                ),
                child: const SpecialButton2(
                  text: 'View all employees',
                ),
              ),
            ),
            14.5.sbH,
            Center(
              child: InkWell(
                onTap: () {},
                child: const SpecialButton2(
                  text: 'Search MDAs',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
