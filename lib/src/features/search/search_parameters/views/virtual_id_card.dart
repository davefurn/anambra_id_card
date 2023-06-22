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

import 'package:acmc/src/model/model.dart';
import 'package:acmc/src/services/flush.dart';
import 'package:acmc/src/services/functions.dart';
import 'package:acmc/src/utils/extension/widget_extension.dart';
import 'package:acmc/src/widgets/card.dart';
import 'package:acmc/src/widgets/special_button_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:screenshot/screenshot.dart';
import 'package:path/path.dart' as p;

class VirtualIDCard extends StatefulWidget {
  final SearchModel model;
  const VirtualIDCard({
    super.key,
    required this.model,
  });

  @override
  State<VirtualIDCard> createState() => _VirtualIDCardState();
}

class _VirtualIDCardState extends State<VirtualIDCard> {
  String showButton = '';

  late ScreenshotController frontController;
  late ScreenshotController backController;

  void downLoadCard(int id) async {
    var path = await GlobalFunctions.downloadPath();
    var fileName = '${widget.model.lastName}${widget.model.firstName}$id.png';

    if (showButton.isNotEmpty) {
      switch (id) {
        case 1:
          await frontController.captureAndSave(path, fileName: fileName);
          break;
        case 2:
          await backController.captureAndSave(path, fileName: fileName);
          break;
      }
      // ignore: use_build_context_synchronously
      ShowFlushBar.showSuccess(
          context: context, message: 'Downloaded to ${p.basename(path)}');
    } else {
      // ignore: use_build_context_synchronously
      ShowFlushBar.showError(context: context, error: 'Cannot download card');
    }
  }

  @override
  void initState() {
    super.initState();
    frontController = ScreenshotController();
    backController = ScreenshotController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          textAlign: TextAlign.start,
          'View ID Card',
          style:
              Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 24),
          maxLines: 1,
        ),
      ),
      body: Column(
        children: [
          37.sbH,
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(right: 20.h),
              child: InkWell(
                onTap: () => downLoadCard(1),
                child: const SpecialButton2(
                  icon: Icon(
                    Icons.download,
                    size: 15,
                  ),
                  text: 'Download Front',
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
          ),
          12.sbH,
          Screenshot(
            controller: frontController,
            child: Cards(
              model: widget.model,
              showDetails: false,
            ),
          ),
          37.sbH,
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(right: 20.h),
              child: InkWell(
                onTap: () => downLoadCard(2),
                child: const SpecialButton2(
                  icon: Icon(
                    Icons.download,
                    size: 15,
                  ),
                  text: 'Download Back',
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
          ),
          12.sbH,
          Screenshot(
            controller: backController,
            child: CardBack(
              employeeId: widget.model.employeeId,
              onLoad: (p0) {
                showButton = p0;
              },
            ),
          ),
        ],
      ),
    );
  }
}
