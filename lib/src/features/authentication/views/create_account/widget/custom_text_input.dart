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

import 'package:acmc/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextInput extends StatelessWidget {
  final String? suffixText;
  final TextAlignVertical? textAlignVertical;
  final double? hpD;
  final IconData? prefixIcon;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool readOnly;
  final bool autofocus;
  final String obscuringCharacter;
  final bool obscureText;
  final bool enableSuggestions;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final void Function()? onEditingComplete;
  final void Function(String)? onSubmitted;
  final bool? enabled;
  final void Function()? onTap;
  final String? hintText;
  final String titleText;
  final String? prefixPath;
  final Widget? suffixIcon;
  final double? width;
  final AutovalidateMode? autovalidateMode;
  const CustomTextInput({
    Key? key,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.readOnly = false,
    this.autofocus = false,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.maxLength,
    this.minLines,
    this.expands = false,
    this.enabled,
    this.onChanged,
    this.controller,
    this.onEditingComplete,
    this.onSubmitted,
    this.onTap,
    this.hintText = '',
    this.suffixIcon,
    this.prefixIcon,
    this.prefixPath,
    required this.titleText,
    this.hpD,
    this.onSaved,
    this.width,
    this.validator,
    this.autovalidateMode,
    this.textAlignVertical,  this.suffixText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: hpD?.w ?? 20.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(titleText,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    )),
            SizedBox(
              height: 8.h,
            ),
            TextFormField(
              textAlignVertical: textAlignVertical,
              controller: controller,
              cursorColor: Colors.black,
              onSaved: onSaved,
              validator: validator,
              focusNode: focusNode,
              keyboardType: keyboardType,
              textInputAction: textInputAction,
              readOnly: readOnly,
              autofocus: autofocus,
              obscuringCharacter: obscuringCharacter,
              obscureText: obscureText,
              maxLength: maxLength,
              maxLines: maxLines,
              minLines: minLines,
              expands: expands,
              onChanged: onChanged,
              onEditingComplete: onEditingComplete,
              onTap: onTap,
              autovalidateMode: autovalidateMode,
              enabled: enabled,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                fontSize: 18,
                height: 1,
                color: Color(0xFF1F2937),
              ),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: IdColors.mainColor,
                    width: 1,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: IdColors.failureColor,
                    width: 1,
                  ),
                ),
                prefixIcon: null,
                suffixText: suffixText,
                suffixIcon: suffixIcon,
                hintText: hintText,
                hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 16,
                      color: IdColors.hintTextColor,
                    ),
                fillColor: IdColors.subColor,
                filled: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
