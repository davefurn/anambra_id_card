import 'dart:ui';

import 'package:acmc/src/constants/colors.dart';
import 'package:acmc/src/utils/extension/widget_extension.dart';
import 'package:acmc/src/widgets/special_button.dart';
import 'package:acmc/src/widgets/special_button_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../widgets/data_testing.dart';

class SearchDetails extends StatelessWidget {
  const SearchDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(
          textAlign: TextAlign.start,
          'Individual\'s Details',
          style:
              Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 24),
          maxLines: 1,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            32.sbH,
            Hero(
              tag: 'abcde',
              child: Container(
                height: 146.h,
                width: 178.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/test_image.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            16.sbH,
            Text(
              'Employee ID: 7348953',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
              ),
            ),
            16.sbH,
            Row(
              children: [
                InkWell(
                  onTap: () => showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    barrierColor: Colors.black.withOpacity(0.61),
                    context: context,
                    builder: (_) {
                      return ScaffoldMessenger(
                        child: Builder(builder: (_) {
                          return Container(
                            height: (428),
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            decoration: const BoxDecoration(
                                color: IdColors.backgroundColour,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                )),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 318.w, right: 21.w),
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(
                                      Icons.close,
                                      size: 24,
                                      color: IdColors.textColorBlack,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: (210),
                                  width: 207.w,
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 64.w),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/qr_code_sample.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                12.sbH,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          const snackBar = SnackBar(
                                              elevation: 0,
                                              backgroundColor:
                                                  Colors.transparent,
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              content: SpecialButton(
                                                icon: Icons.download_done,
                                                iconColor: IdColors.green,
                                                text: 'Action successful',
                                                width: 180,
                                                height: 40,
                                                borderColor: IdColors.green,
                                              ));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);

                                          // Find the ScaffoldMessenger in the widget tree
                                          // and use it to show a SnackBar.
                                        },
                                        child: const SpecialButton(
                                          icon: Icons.refresh,
                                          text: 'Regenerate code',
                                          width: 157,
                                        )),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    const SpecialButton(
                                        icon: Icons.download, text: 'Download')
                                  ],
                                )
                              ],
                            ),
                          );
                        }),
                      );
                    },
                  ),
                  child: const SpecialButton2(
                    icon: Icon(Icons.qr_code),
                    text: 'View QR code',
                    // width: 132,
                    // height: 32,
                    backgroundColor: Colors.transparent,
                    // borderColor: Colors.transparent,
                  ),
                ),
                8.sbW,
                SpecialButton2(
                  icon: SvgPicture.asset('assets/svgs/id_card.svg'),
                  text: 'View ID card',
                  // width: 132,
                  // height: 32,
                  backgroundColor: Colors.transparent,
                  // borderColor: Colors.transparent,
                )
              ],
            ),
            16.sbH,
            const DataTesting(
              firstText: 'First Name',
              secondText: 'Chidinma',
            ),
            16.sbH,
            const DataTesting(
              firstText: 'Middle Name',
              secondText: 'Deborah',
            ),
            16.sbH,
            const DataTesting(
              firstText: 'Last Name',
              secondText: 'Maduka',
            ),
            16.sbH,
            const DataTesting(
              firstText: 'Email',
              secondText: 'debbiedinma44@gmail.com',
            ),
            16.sbH,
            const DataTesting(
              firstText: 'Phone Number',
              secondText: '08164684852',
            ),
            16.sbH,
            const DataTesting(
              firstText: 'Department',
              secondText: 'Human Resources',
            ),
            16.sbH,
            const DataTesting(
              firstText: 'Sub-department',
              secondText: 'Recruiting',
            ),
            16.sbH,
            const DataTesting(
              firstText: 'Role/grade level',
              secondText: 'Recruiting',
            ),
            16.sbH,
            const DataTesting(
              firstText: 'Verification ID',
              secondText: 'Recruiting',
            ),
            16.sbH,
            const DataTesting(
              firstText: 'MDA',
              secondText: 'ICT Agency',
            ),
            16.sbH,
            const DataTesting(
              firstText: 'Status',
              secondText: 'Active',
              color: IdColors.green,
              fontWeight: FontWeight.w700,
            ),
            100.sbH,
          ],
        ),
      ),
    );
  }
}
