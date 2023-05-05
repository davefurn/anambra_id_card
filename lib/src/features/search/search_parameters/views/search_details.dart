import 'package:acmc/src/constants/colors.dart';
import 'package:acmc/src/extension/size_config.dart';
import 'package:acmc/src/widgets/special_button.dart';
import 'package:acmc/src/widgets/title_back_button.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/data_testing.dart';

class SearchDetails extends StatelessWidget {
  const SearchDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = new GlobalKey<ScaffoldState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          textAlign: TextAlign.start,
          'Individual\'s Details',
          style:
              Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 24),
          maxLines: 1,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(32),
            ),
            Hero(
              tag: 'abcde',
              child: Container(
                height: getProportionateScreenHeight(146),
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
              height: getProportionateScreenHeight(16),
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
                            height: getProportionateScreenHeight(428),
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
                                  height: getProportionateScreenHeight(210),
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
                                  height: getProportionateScreenHeight(11),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                        onTap: () {  
                                          final snackBar = const SnackBar(
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
              height: getProportionateScreenHeight(16),
            ),
            const DataTesting(
              firstText: 'First Name',
              secondText: 'Chidinma',
            ),
            SizedBox(
              height: getProportionateScreenHeight(16),
            ),
            const DataTesting(
              firstText: 'Middle Name',
              secondText: 'Deborah',
            ),
            SizedBox(
              height: getProportionateScreenHeight(16),
            ),
            const DataTesting(
              firstText: 'Last Name',
              secondText: 'Maduka',
            ),
            SizedBox(
              height: getProportionateScreenHeight(16),
            ),
            const DataTesting(
              firstText: 'Email',
              secondText: 'debbiedinma44@gmail.com',
            ),
            SizedBox(
              height: getProportionateScreenHeight(16),
            ),
            const DataTesting(
              firstText: 'Phone Number',
              secondText: '08164684852',
            ),
            SizedBox(
              height: getProportionateScreenHeight(16),
            ),
            const DataTesting(
              firstText: 'Department',
              secondText: 'Human Resources',
            ),
            SizedBox(
              height: getProportionateScreenHeight(16),
            ),
            const DataTesting(
              firstText: 'Sub-department',
              secondText: 'Recruiting',
            ),
            SizedBox(
              height: getProportionateScreenHeight(16),
            ),
            const DataTesting(
              firstText: 'Role/grade level',
              secondText: 'Recruiting',
            ),
            SizedBox(
              height: getProportionateScreenHeight(16),
            ),
            const DataTesting(
              firstText: 'Verification ID',
              secondText: 'Recruiting',
            ),
            SizedBox(
              height: getProportionateScreenHeight(16),
            ),
            const DataTesting(
              firstText: 'MDA',
              secondText: 'ICT Agency',
            ),
            SizedBox(
              height: getProportionateScreenHeight(16),
            ),
            const DataTesting(
              firstText: 'Status',
              secondText: 'Active',
              color: IdColors.green,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(
              height: getProportionateScreenHeight(97),
            ),
          ],
        ),
      ),
    );
  }
}
