// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:acmc/src/features/home/views/bottom_nav.dart';
import 'package:acmc/src/features/search/search_parameters/virtual_id_card.dart';
import 'package:acmc/src/model/model.dart';
import 'package:acmc/src/router/app_routes.dart';
import 'package:acmc/src/widgets/data_testing.dart';
import 'package:acmc/src/widgets/expansion_tile.dart';
import 'package:acmc/src/widgets/image_loader.dart';
import 'package:acmc/src/widgets/qrcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:acmc/src/constants/colors.dart';
import 'package:acmc/src/utils/extension/widget_extension.dart';
import 'package:acmc/src/widgets/special_button_2.dart';

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
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              80.sbH,
              Center(
                child: QRCodeWidget(
                  employeeId: widget.model.employeeId,
                  height: 150.h,
                  width: 150.h,
                  onLoad: (p0) {},
                ),
              ),
              120.sbH,
            ],
          ),
        );
      },
    );
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
                DataTesting(
                  firstText: 'First Name',
                  secondText: widget.model.firstName,
                ),
                16.sbH,
                DataTesting(
                  firstText: 'Middle Name',
                  secondText: widget.model.middleName,
                ),
                16.sbH,
                DataTesting(
                  firstText: 'Last Name',
                  secondText: widget.model.lastName,
                ),
                16.sbH,
                DataTesting(
                  firstText: 'Email',
                  secondText: widget.model.email,
                ),
                16.sbH,
                DataTesting(
                  firstText: 'Phone Number',
                  secondText: widget.model.contactNo,
                ),
                16.sbH,
              ],
            ),
            8.sbH,
            Expansion1(
              icon: Icons.location_on,
              mainText: 'LOCATION DETAILS',
              widgets: [
                DataTesting(
                  firstText: 'Address',
                  secondText: widget.model.address,
                ),
                16.sbH,
                DataTesting(
                  firstText: 'Town',
                  secondText: widget.model.town,
                ),
                16.sbH,
                DataTesting(
                  firstText: 'City',
                  secondText: widget.model.city,
                ),
                16.sbH,
                DataTesting(
                  firstText: 'State',
                  secondText: widget.model.state,
                ),
                16.sbH,
                // const DataTesting(
                //   firstText: 'Contact No:',
                //   secondText: '08164684852',
                // ),
                // 16.sbH,
                // const DataTesting(
                //   firstText: 'Social Links',
                //   secondText: 'linkedin.com/in/chiazaokoli',
                // ),
                // 16.sbH,
              ],
            ),
            8.sbH,
            Expansion1(
              icon: Icons.location_on,
              mainText: 'PERSONAL DETAILS',
              widgets: [
                DataTesting(
                  firstText: 'Marital Status',
                  secondText: widget.model.maritalStatus,
                ),
                16.sbH,
                DataTesting(
                  firstText: 'Date of Joining',
                  secondText: widget.model.dateOfJoining,
                ),
                16.sbH,
                DataTesting(
                  firstText: 'Date of leaving',
                  secondText: widget.model.dateOfLeaving,
                ),
                16.sbH,
                DataTesting(
                  firstText: 'Date of birth',
                  secondText: widget.model.dateOfBirth,
                ),
                16.sbH,
                DataTesting(
                  firstText: 'Data Status',
                  secondText: widget.model.dataStatus,
                ),
                16.sbH,
                DataTesting(
                  firstText: 'Gender',
                  secondText: widget.model.gender,
                ),
                16.sbH,
                DataTesting(
                  firstText: 'State of Origin',
                  secondText: widget.model.stateOfOrigin,
                ),
                16.sbH,
              ],
            ),
            8.sbH,
            Expansion1(
              icon: Icons.work,
              mainText: 'WORK DETAILS',
              widgets: [
                DataTesting(
                  firstText: 'Employee Type',
                  secondText: widget.model.employeeType,
                ),
                // 16.sbH,
                //  DataTesting(
                //   firstText: 'Basic Salary',
                //   secondText:'N ${widget.model.basicSalary}',
                // ),
                16.sbH,
                DataTesting(
                  firstText: 'Grade',
                  secondText: widget.model.grade,
                ),
                16.sbH,
                if (widget.model.departments != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DataTesting(
                        firstText: 'Department',
                        secondText: widget.model.departments!.departmentName,
                      ),
                      16.sbH,
                    ],
                  ),
                if (widget.model.designation != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DataTesting(
                        firstText: 'Designation',
                        secondText: widget.model.designation!.designationName,
                      ),
                      16.sbH,
                    ],
                  ),

                if (widget.model.government != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DataTesting(
                        firstText: 'Government ',
                        secondText: widget.model.government!.governmentName,
                      ),
                      16.sbH,
                    ],
                  ),
              ],
            ),
            8.sbH,
            Expansion1(
              icon: Icons.more_horiz,
              mainText: 'OTHER DETAILS',
              widgets: [
                DataTesting(
                  firstText: 'Verification ID',
                  secondText: widget.model.verificationId,
                ),
                // 16.sbH,
                // const DataTesting(
                //   firstText: 'Middle Name',
                //   secondText: 'Deborah',
                // ),
                // 16.sbH,
                // const DataTesting(
                //   firstText: 'Last Name',
                //   secondText: 'Maduka',
                // ),
                // 16.sbH,
                // const DataTesting(
                //   firstText: 'Email',
                //   secondText: 'debbiedinma44@gmail.com',
                // ),
                // 16.sbH,
                // const DataTesting(
                //   firstText: 'Phone Number',
                //   secondText: '08164684852',
                // ),
                // 16.sbH,
                // const DataTesting(
                //   firstText: 'Social Links',
                //   secondText: 'linkedin.com/in/chiazaokoli',
                // ),
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
