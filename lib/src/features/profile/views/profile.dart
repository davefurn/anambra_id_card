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

import 'dart:io';

import 'package:acmc/src/services/flush.dart';
import 'package:acmc/src/services/functions.dart';
import 'package:acmc/src/services/local_storage.dart';
import 'package:acmc/src/utils/extension/widget_extension.dart';
import 'package:acmc/src/widgets/qrcode_widget.dart';
import 'package:acmc/src/widgets/special_button_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vcard_maintained/vcard_maintained.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String qrcode = '';
  late ScreenshotController controller;
  Future<void> downloadVCard() async {
    var data = await LocalStorage.instance.getUserData();
    var vCard = VCard();

    vCard.firstName = data.userData.firstName;
    vCard.lastName = data.userData.lastName;
    vCard.organization = data.department;
    vCard.workPhone = data.userData.phone;
    vCard.url =
        'https://idm.anambrastate.gov.ng/api/auth/${data.userData.staffId}';

    var path = await GlobalFunctions.downloadPath();

    var dir = await getApplicationDocumentsDirectory();

    var file = File('${dir.path}/vCard/exports/contact.vcf');
    file.createSync(recursive: true);

    await vCard.saveToFile('contact.vcf');

    var down = '$path/contact.vcf';
    var a = File(down);
    a.createSync(recursive: true);
    file.copySync(a.path);
    // ignore: use_build_context_synchronously
    ShowFlushBar.showSuccess(context: context);
  }

  Future<void> downloadQRCode({bool share = false}) async {
    if (qrcode.isNotEmpty) {
      var path = await GlobalFunctions.downloadPath();
      var data = await LocalStorage.instance.getUserData();
      var fileName =
          '${data.userData.lastName}${data.userData.firstName}${data.userData.staffId}.png';
      var a = await controller.captureAndSave(path, fileName: fileName);
      if (!share) {
        // ignore: use_build_context_synchronously
        ShowFlushBar.showSuccess(context: context);
      } else {
        Share.shareXFiles([XFile(a!)]);
      }
    } else {
      ShowFlushBar.showError(
        context: context,
        error: 'No qrcode to ${share ? 'share' : 'download'}',
      );
    }
  }

  @override
  void initState() {
    super.initState();
    controller = ScreenshotController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style:
              Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 24),
          maxLines: 1,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          top: 30.h,
        ),
        children: [
          12.sbH,
          FutureBuilder(
            future: LocalStorage.instance.getStaffId(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SizedBox.shrink();
              } else {
                return Screenshot(
                  controller: controller,
                  child: QRCodeWidget(
                    employeeId: snapshot.data!,
                    height: 210.h,
                    width: 207.h,
                    onLoad: (a) {
                      qrcode = a;
                    },
                  ),
                );
              }
            },
          ),
          15.sbH,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SpecialButton2(
                text: 'Download',
                onTap: downloadQRCode,
                icon: SvgPicture.asset('assets/svgs/download.svg'),
              ),
              8.sbW,
              SpecialButton2(
                text: 'Share',
                onTap: () => downloadQRCode(share: true),
                icon: SvgPicture.asset('assets/svgs/share.svg'),
              )
            ],
          ),
          32.sbH,
          const Center(
            child: Text(
              'VCard',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
          12.sbH,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset('assets/svgs/info.svg'),
              const Expanded(
                child: Text(
                  '''Vcard is a file that contains your contact details. It can be downloaded and shared with any individual.
Once they click the file, it opens in their contact app with your contact details ready to be saved automatically.''',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color(0xffA3A3A3),
                  ),
                ),
              ),
            ],
          ),
          12.sbH,
          const Center(
            child: Text(
              'Click to watch how it works',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: Color(0xffD69908),
              ),
            ),
          ),
          12.sbH,
          Center(
            child: SpecialButton2(
              text: 'Download VCard',
              onTap: downloadVCard,
              icon: SvgPicture.asset('assets/svgs/download.svg'),
            ),
          )
        ],
      ),
    );
  }
}
