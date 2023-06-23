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

// ignore_for_file: use_build_context_synchronously

import 'package:acmc/src/features/authentication/create_account/widget/custom_text_input.dart';
import 'package:acmc/src/model/enums.dart';
import 'package:acmc/src/services/flush.dart';
import 'package:acmc/src/services/put_request.dart';
import 'package:acmc/src/utils/extension/widget_extension.dart';
import 'package:acmc/src/widgets/loading_button.dart';
import 'package:flutter/material.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class ChangePassword extends StatefulWidget {
  const ChangePassword({
    super.key,
  });

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  late TextEditingController oldController;
  late TextEditingController newController;
  final _formKey = GlobalKey<FormState>();
  bool submitted = false;
  var state = LoadingState.normal;

  @override
  void initState() {
    super.initState();
    oldController = TextEditingController();
    newController = TextEditingController();
  }

  @override
  void dispose() {
    oldController = TextEditingController();
    newController = TextEditingController();
    super.dispose();
  }

  Future<void> verify() async {
    setState(() {
      state = LoadingState.loading;
    });
    var reset = await PutRequest.resetPassword({
      'current_password': oldController.text,
      'new_password': newController.text
    });
    setState(() {
      state = LoadingState.normal;
    });
    if (reset != null) {
      if (reset.statusCode != 200) {
        ShowFlushBar.showError(context: context, error: reset.data['message']);
      } else {
        newController.clear();
        oldController.clear();
        ShowFlushBar.showSuccess(context: context);
      }
    } else {
      ShowFlushBar.showError(context: context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          textAlign: TextAlign.start,
          'Change password',
          style:
              Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 24),
          maxLines: 1,
        ),
        centerTitle: false,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            40.sbH,
            CustomTextInput(
              controller: oldController,
              titleText: 'Current password',
              hintText: 'Enter your current password',
              autovalidateMode: submitted
                  ? AutovalidateMode.onUserInteraction
                  : AutovalidateMode.disabled,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your current password";
                }
                return null;
              },
            ),
            20.sbH,
            CustomTextInput(
              controller: newController,
              titleText: 'New password',
              hintText: 'Enter your new password',
              autovalidateMode: submitted
                  ? AutovalidateMode.onUserInteraction
                  : AutovalidateMode.disabled,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your new password";
                }
                return null;
              },
            ),
            50.sbH,
            LoadingButton(
              text: 'Send Request',
              state: state,
              onTap: () {
                setState(() => submitted = true);
                if (_formKey.currentState!.validate()) {
                  verify();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
