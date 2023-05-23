import 'package:acmc/src/constants/colors.dart';
import 'package:acmc/src/model/enums.dart';
import 'package:flutter/material.dart';

class LoadingButton extends StatefulWidget {
  final LoadingState state;
  final Function() onTap;
  final String text;
  const LoadingButton(
      {super.key,
      required this.state,
      required this.onTap,
      required this.text});

  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      onPressed: () {
        if (widget.state == LoadingState.normal) {
          widget.onTap();
        }
      },
      color: IdColors.mainColor,
      minWidth: MediaQuery.of(context).size.width * 0.9,
      height: 50,
      child: widget.state == LoadingState.loading
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                strokeWidth: 3,
                color: Colors.black,
              ),
            )
          : widget.state == LoadingState.finished
              ? const Icon(
                  Icons.check_circle,
                  color: Colors.white,
                  size: 30,
                )
              : Text(
                  widget.text,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16,
                      ),
                ),
    );
  }
}
