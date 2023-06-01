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

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widgets/special_button.dart';

class FailedScan extends ConsumerWidget {
  const FailedScan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          textAlign: TextAlign.start,
          'Scan QR Code',
          style:
              Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 24),
          maxLines: 1,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.info_outline,
              color: Color(0xffF97618),
              size: 20,
            ),
            SizedBox(
              height: 6.h,
            ),
            Text(
              "No result found",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            SizedBox(
              height: 6.h,
            ),
            GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const SpecialButton(
                  icon: Icons.search,
                  text: 'Search again',
                  width: 129,
                )),
          ],
        ),
      ),
    );
  }
}
