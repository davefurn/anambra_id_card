import 'package:acmc/src/constants/colors.dart';
import 'package:acmc/src/utils/extension/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  String policy = '';

  Future<String> getFileData(String path) async {
    return await rootBundle.loadString(path);
  }

  @override
  void initState() {
    super.initState();
    getFileData('assets/doc/privacy_policy.txt')
        .then((value) => setState(() => policy = value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          textAlign: TextAlign.start,
          'Privacy Policy',
          style:
              Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 24),
          maxLines: 1,
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(
          20.r,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              policy,
              style: const TextStyle(
                color: IdColors.textColorBlack,
              ),
            ),
            100.sbH,
          ],
        ),
      ),
    );
  }
}
