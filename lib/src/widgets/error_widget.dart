import 'package:acmc/src/services/functions.dart';
import 'package:acmc/src/utils/extension/widget_extension.dart';
import 'package:flutter/material.dart';

class AppErrorWidget extends StatefulWidget {
  final dynamic errorData;
  final Widget? retry;
  final int? errorCode;
  const AppErrorWidget({
    super.key,
    this.errorData,
    this.retry,
    this.errorCode,
  });

  @override
  State<AppErrorWidget> createState() => _AppErrorWidgetState();
}

class _AppErrorWidgetState extends State<AppErrorWidget> {
  String error = 'Something went wrong';
  @override
  void initState() {
    super.initState();

    if (widget.errorData != null) {
      try {
        if (widget.errorData!.containsKey('error')) {
          error = widget.errorData!['error']['message'];
        } else {
          error = widget.errorData!['message']['errors'];
        }
      } catch (_) {
        error = "Something went wrong";
      }
    }
    if (widget.errorCode == 401) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        GlobalFunctions.expiredeSession(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(error),
        20.sbH,
        if (widget.retry != null) widget.retry!,
      ],
    );
  }
}
