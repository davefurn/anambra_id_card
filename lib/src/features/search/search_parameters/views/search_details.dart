import 'package:acmc/src/constants/colors.dart';
import 'package:acmc/src/widgets/special_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 32.h,
            ),
            Hero(
              tag: 'abcde',
              child: Container(
                height: 146.h,
                width: getProportionateScreenWidth(178),
                margin: EdgeInsets.only(
                    left: getProportionateScreenWidth(20),
                    right: getProportionateScreenWidth(186)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/test_image.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
              child: GestureDetector(
                onTap: () => showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    barrierColor: Colors.black.withOpacity(0.61),
                    context: context,
                    builder: (_) {
                      return ScaffoldMessenger(
                        child: Builder(builder: (_) {
                          return Container(
                            height: (428),
                            padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(20),
                            ),
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
                                  padding: EdgeInsets.only(
                                      left: getProportionateScreenWidth(318),
                                      right: getProportionateScreenWidth(21)),
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
                                  width: getProportionateScreenWidth(207),
                                  margin: EdgeInsets.symmetric(
                                      horizontal:
                                          getProportionateScreenWidth(64)),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/qr_code_sample.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: (11),
                                ),
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
                                      width: getProportionateScreenWidth(4),
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
                    }),
                child: const SpecialButton(
                  icon: Icons.qr_code,
                  text: 'View QR code',
                  width: 132,
                  height: 32,
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            const DataTesting(
              firstText: 'First Name',
              secondText: 'Chidinma',
            ),
            SizedBox(
              height: 16.h,
            ),
            const DataTesting(
              firstText: 'Middle Name',
              secondText: 'Deborah',
            ),
            SizedBox(
              height: 16.h,
            ),
            const DataTesting(
              firstText: 'Last Name',
              secondText: 'Maduka',
            ),
            SizedBox(
              height: 16.h,
            ),
            const DataTesting(
              firstText: 'Email',
              secondText: 'debbiedinma44@gmail.com',
            ),
            SizedBox(
              height: 16.h,
            ),
            const DataTesting(
              firstText: 'Phone Number',
              secondText: '08164684852',
            ),
            SizedBox(
              height: 16.h,
            ),
            const DataTesting(
              firstText: 'Department',
              secondText: 'Human Resources',
            ),
            SizedBox(
              height: 16.h,
            ),
            const DataTesting(
              firstText: 'Sub-department',
              secondText: 'Recruiting',
            ),
            SizedBox(
              height: 16.h,
            ),
            const DataTesting(
              firstText: 'Role/grade level',
              secondText: 'Recruiting',
            ),
            SizedBox(
              height: 16.h,
            ),
            const DataTesting(
              firstText: 'Verification ID',
              secondText: 'Recruiting',
            ),
            SizedBox(
              height: 16.h,
            ),
            const DataTesting(
              firstText: 'MDA',
              secondText: 'ICT Agency',
            ),
            SizedBox(
              height: 16.h,
            ),
            const DataTesting(
              firstText: 'Status',
              secondText: 'Active',
              color: IdColors.green,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(
              height: (97),
            ),
          ],
        ),
      ),
    );
  }
}
