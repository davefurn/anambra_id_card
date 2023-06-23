import 'package:flutter/material.dart';

class AppErrorWidget extends StatefulWidget {
  final dynamic errorData;
  final Widget? retry;
  const AppErrorWidget({
    super.key,
    this.errorData,
    this.retry,
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
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [Text(error), if (widget.retry != null) widget.retry!],
    );
  }
}
