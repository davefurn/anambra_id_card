// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:acmc/src/features/home/views/bottom_nav.dart';
import 'package:acmc/src/features/search/search_parameters/views/virtual_id_card.dart';
import 'package:acmc/src/model/model.dart';
import 'package:acmc/src/services/post_requests.dart';
import 'package:acmc/src/widgets/expansion_tile.dart';
import 'package:acmc/src/widgets/image_loader.dart';
import 'package:acmc/src/widgets/qrcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:acmc/src/constants/colors.dart';
import 'package:acmc/src/utils/extension/widget_extension.dart';
import 'package:acmc/src/widgets/special_button.dart';
import 'package:acmc/src/widgets/special_button_2.dart';

import '../../../../router/app_routes.dart';
import '../../../../widgets/data_testing.dart';

class SearchDetails extends StatefulWidget {
  final SearchModel model;
  const SearchDetails({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  State<SearchDetails> createState() => _SearchDetailsState();
}

class _SearchDetailsState extends State<SearchDetails> {
  String base64 = '';

  @override
  void initState() {
    super.initState();

    PostRequest.generateQRCode(widget.model.employeeId).then((value) {
      if (value != null &&
          value.data != null &&
          value.data['status'] == 'success') {
        base64 = (value.data['data']['qr_code_image'] as String).substring(22);
      }
    });
  }

  void openQRCode() async {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        barrierColor: Colors.black.withOpacity(0.61),
        context: globalContext,
        builder: (_) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: const BoxDecoration(
                color: IdColors.backgroundColour,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                )),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                25.sbH,
                Center(
                  child: QRCodeWidget(
                    employeeId: widget.model.employeeId,
                    height: 100.h,
                    width: 100.h,
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
                              backgroundColor: Colors.transparent,
                              behavior: SnackBarBehavior.floating,
                              content: SpecialButton(
                                icon: Icons.download_done,
                                iconColor: IdColors.green,
                                text: 'Action successful',
                                width: 180,
                                height: 40,
                                borderColor: IdColors.green,
                              ));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);

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
                    // const SpecialButton(
                    //   icon: Icons.download,
                    //   text: 'Download',
                    // )
                  ],
                ),
                120.sbH,
              ],
            ),
          );
        });
  }

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
              tag: widget.model.employeeId,
              child: SizedBox(
                height: 146.h,
                width: 178.w,
                child: ImageLoader(
                  image: widget.model.profilePicture,
                  boxFit: BoxFit.cover,
                ),
              ),
            ),
            16.sbH,
            Text(
              'Employee ID: ${widget.model.employeeId}',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
              ),
            ),
            16.sbH,
            Row(
              children: [
                InkWell(
                  onTap: openQRCode,
                  child: SpecialButton2(
                    icon: SvgPicture.asset('assets/svgs/qrcode.svg'),
                    text: 'View QR code',
                    // width: 132,
                    // height: 32,
                    backgroundColor: Colors.transparent,
                    // borderColor: Colors.transparent,
                  ),
                ),
                8.sbW,
                InkWell(
                  onTap: () {
                    pushTo(
                      context,
                      VirtualIDCard(
                        base64: base64,
                        model: widget.model,
                      ),
                    );
                  },
                  child: SpecialButton2(
                    icon: SvgPicture.asset('assets/svgs/id_card.svg'),
                    text: 'View ID card',
                    // width: 132,
                    // height: 32,
                    backgroundColor: Colors.transparent,
                    // borderColor: Colors.transparent,
                  ),
                )
              ],
            ),
            16.sbH,
            Expansion1(
              icon: Icons.contact_phone,
              mainText: 'CONTACT DETAILS',
              widgets: [
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
                  firstText: 'Social Links',
                  secondText: 'linkedin.com/in/chiazaokoli',
                ),
                16.sbH,
              ],
            ),
            8.sbH,
            Expansion1(
              icon: Icons.location_on,
              mainText: 'LOCATION DETAILS',
              widgets: [
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
                  firstText: 'Social Links',
                  secondText: 'linkedin.com/in/chiazaokoli',
                ),
                16.sbH,
              ],
            ),
            8.sbH,
            Expansion1(
              icon: Icons.location_on,
              mainText: 'PERSONAL DETAILS',
              widgets: [
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
                  firstText: 'Social Links',
                  secondText: 'linkedin.com/in/chiazaokoli',
                ),
                16.sbH,
              ],
            ),
            8.sbH,
            Expansion1(
              icon: Icons.work,
              mainText: 'WORK DETAILS',
              widgets: [
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
                  firstText: 'Social Links',
                  secondText: 'linkedin.com/in/chiazaokoli',
                ),
                16.sbH,
              ],
            ),
            8.sbH,
            Expansion1(
              icon: Icons.more_horiz,
              mainText: 'OTHER DETAILS',
              widgets: [
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
                  firstText: 'Social Links',
                  secondText: 'linkedin.com/in/chiazaokoli',
                ),
                16.sbH,
              ],
            ),
            100.sbH,
          ],
        ),
      ),
    );
  }
}
