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
import 'package:acmc/src/constants/end_points.dart';

import 'package:acmc/src/features/all_employees/views/all_employees.dart';
import 'package:acmc/src/features/history/views/history.dart';
import 'package:acmc/src/features/home/widgets/query_container.dart';
import 'package:acmc/src/features/search/search_parameters/views/search_parameters.dart';
import 'package:acmc/src/features/search_mda/view/view.dart';
import 'package:acmc/src/features/statistics/views/view.dart';
import 'package:acmc/src/model/enums.dart';
import 'package:acmc/src/router/app_routes.dart';
import 'package:acmc/src/services/local_storage.dart';
import 'package:acmc/src/utils/extension/widget_extension.dart';
import 'package:acmc/src/widgets/image_loader.dart';
import 'package:acmc/src/widgets/special_button_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../search/qr_scanner/views/results.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var accessLevel = AccessLevel.none;
  String name = '';
  String department = '';
  String designation = '';
   List<String> names = [
    'ekene favour',
    'chukwuemeka victor',
    'Oragbene victory',
    'Okoh Chinaza',
    'Favour Godspower',
    'Kenechukwu Isaac',
    'Shedrack christian',
    'Olamide Ireoluwa'
  ];

  List<String> email = [
    'ekene.favour@anambrastate.gov.ng',
    'chukwuemeka.victor@anambrastate.gov.ng',
    'Oragbene.victory@anambrastate.gov.ng',
    'Okoh.Chinaza@anambrastate.gov.ng',
    'Favour.Godspower@anambrastate.gov.ng',
    'Kenechukwu.Isaac@anambrastate.gov.ng',
    'Shedrack.christian@anambrastate.gov.ng',
    'Olamide.Ireoluwa@anambrastate.gov.ng'
  ];

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
    if (!mounted) {}
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      LocalStorage.instance.getUserData().then((value) {
        name = '${value.userData.lastName} ${value.userData.firstName}';
        department = value.department;
        designation = value.designation;
        // accessLevel = value.userData.role.toAccessLevel();
        accessLevel = AccessLevel.demo;
      });
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(
          left: 20.w,
          top: 60.h,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(color: IdColors.textColorBlack),
                      ),
                      Text(
                        department,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(
                                color: IdColors.textColorBlack,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        designation,
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  color: IdColors.textColorBlack,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                8.sbW,
                FutureBuilder(
                  future: LocalStorage.instance.getUserData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SizedBox.shrink();
                    } else {
                      return ImageLoader(
                        image: AppEndpoints.pictureUrl +
                            snapshot.data!.employeeData.profilePicture,
                        height: 60,
                        width: 60,
                        radius: 0,
                        isCircle: true,
                        boxFit: BoxFit.cover,
                      );
                    }
                  },
                ),
                20.sbW,
              ],
            ),
            SizedBox(
              height: 32.h,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.info_outline,
                    color: IdColors.otpGrey,
                    size: 16.33,
                  ),
                  SizedBox(
                    width: 5.33.w,
                  ),
                  Expanded(
                    child: FittedBox(
                      child: Text(
                        'You can only search for those within your MDA',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: IdColors.otpGrey,
                            ),
                      ),
                    ),
                  ),
                  20.sbW,
                ],
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 160.h / 150.h,
              crossAxisSpacing: 16.w,
              shrinkWrap: true,
              padding: EdgeInsets.only(right: 20.w),
              physics: const NeverScrollableScrollPhysics(),
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
              height: 26.h,
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 20.w),
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
                        width: 5.73.w,
                      ),
                      GestureDetector(
                        onTap: () {
                          pushTo(context, const History());
                        },
                        child: Row(
                          children: [
                            Text(
                              'More',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: IdColors.textColorGrey,
                                  ),
                            ),
                            4.sbW,
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 14.r,
                              color: IdColors.textColorYellow,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 90.h,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: names.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 153.w,
                          decoration: BoxDecoration(
                            color: IdColors.mainGrey,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          margin: EdgeInsets.only(right: 8.w),
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 8.h,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                names[index],
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
                                email[index],
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
                                            color: IdColors.green),
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
                SizedBox(
                  height: 26.h,
                ),
              ],
            ),
            /////////
            if ([AccessLevel.admin, AccessLevel.auditor, AccessLevel.demo]
                .contains(accessLevel))
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Statistics',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
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
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: IdColors.textColorGrey,
                                    ),
                              ),
                              4.sbW,
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 14.r,
                                color: IdColors.textColorYellow,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    height: 60.h,
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
                              margin: EdgeInsets.only(right: 4.w),
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 6.h,
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
                    height: 40.5.h,
                  ),
                ],
              ),
            /////////
            if ([AccessLevel.admin, AccessLevel.demo].contains(accessLevel))
              Column(
                children: [
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
                ],
              ),
            ////////
            if ([AccessLevel.auditor, AccessLevel.demo].contains(accessLevel))
              Center(
                child: InkWell(
                  onTap: () => pushTo(
                    context,
                    const SearchMDAScreen(),
                  ),
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

