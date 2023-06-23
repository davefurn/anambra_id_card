import 'package:acmc/src/constants/colors.dart';
import 'package:acmc/src/features/authentication/create_account/widget/custom_text_input.dart';
import 'package:acmc/src/features/home/widgets/query_container.dart';
import 'package:acmc/src/features/visitor_management/confirm_token_details.dart';
import 'package:acmc/src/model/enums.dart';
import 'package:acmc/src/router/app_routes.dart';
import 'package:acmc/src/utils/extension/widget_extension.dart';
import 'package:acmc/src/widgets/loading_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmToken extends StatefulWidget {
  const ConfirmToken({super.key});

  @override
  State<ConfirmToken> createState() => _ConfirmTokenState();
}

class _ConfirmTokenState extends State<ConfirmToken> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          textAlign: TextAlign.start,
          'Confirm a token',
          style:
              Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 24),
        ),
      ),
      body: Column(
        children: [
          70.sbH,
          Center(
            child: InkWell(
              onTap: () {},
              child: QueryContainer(
                colors: const [
                  Color(0xff63DBE2),
                  Color(0xff2E7CC3),
                ],
                width: 160.h,
                height: 144.w,
                description: 'Use your camera to capture the QR code ',
                svgAsset: 'assets/svgs/scan_qr.svg',
                svgAssetText: 'Scan QR code',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 50.h),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 1,
                  width: 50,
                  color: IdColors.hintTextColor,
                  margin: const EdgeInsets.only(right: 10),
                ),
                Text(
                  'or',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                  ),
                ),
                Container(
                  height: 1,
                  width: 50,
                  color: IdColors.hintTextColor,
                  margin: const EdgeInsets.only(left: 10),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Expanded(
                  child: CustomTextInput(
                    titleText: 'Enter token',
                    hpD: 0,
                    keyboardType: TextInputType.numberWithOptions(),
                  ),
                ),
                8.sbW,
                LoadingButton(
                  state: LoadingState.normal,
                  onTap: () => pushTo(context, const ConfirmTicket()),
                  text: 'Go',
                  width: 15,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
