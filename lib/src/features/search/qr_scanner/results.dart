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

import 'package:acmc/src/features/search/search_parameters/searching.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QrCode extends ConsumerStatefulWidget {
  final String code;
  const QrCode({Key? key, required this.code}) : super(key: key);

  @override
  ConsumerState<QrCode> createState() => _QrCodeState();
}

class _QrCodeState extends ConsumerState<QrCode> {
  bool _isBusy = false;

  String resultText = '';

  @override
  void initState() {
    super.initState();
    final String code = widget.code;
    processCode(code);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _isBusy
          ? AppBar(
              title: Text(
                textAlign: TextAlign.start,
                'Scan QR Code',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(fontSize: 24),
                maxLines: 1,
              ),
            )
          : null,
      body: _isBusy == true
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : Searching(
              searchWord: resultText,
              identifier: 'employee_id',
            ),
    );
  }

  void processCode(String? code) async {
    setState(() {
      _isBusy = true;
    });
    resultText = code!;
    // resultText = '22007491';

    setState(() {
      _isBusy = false;
    });
  }
}
