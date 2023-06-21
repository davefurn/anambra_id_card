import 'package:flutter/material.dart';

class AppErrorWidget extends StatefulWidget {
  final Object? error;
  final Map? errorData;
  final Widget? retry;
  const AppErrorWidget({
    super.key,
    this.error,
    this.errorData,
    this.retry,
  });

  @override
  State<AppErrorWidget> createState() => _AppErrorWidgetState();
}

class _AppErrorWidgetState extends State<AppErrorWidget> {
  String? error;
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
      children: [
        if (widget.errorData != null) Text(error ?? "Something went wrong"),
        if (widget.retry != null) widget.retry!
      ],
    );
  }
}
