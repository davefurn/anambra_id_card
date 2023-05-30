import 'package:acmc/src/constants/colors.dart';
import 'package:acmc/src/model/enums.dart';
import 'package:acmc/src/utils/extension/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchParameterWidget extends StatefulWidget {
  final String text;
  final void Function(SearchParameter) onTap;
  final SearchParameter parameter;
  final SearchParameter family;
  final IconData iconData;
  const SearchParameterWidget({
    super.key,
    required this.text,
    required this.onTap,
    required this.parameter,
    required this.family,
    required this.iconData,
  });

  @override
  State<SearchParameterWidget> createState() => _SearchParameterWidgetState();
}

class _SearchParameterWidgetState extends State<SearchParameterWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onTap(widget.parameter),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: widget.family == widget.parameter
              ? IdColors.fadedMainColor
              : Colors.transparent,
          border: Border.all(
            color: widget.family == widget.parameter
                ? IdColors.mainColor
                : IdColors.grey,
          ),
        ),
        padding: EdgeInsets.all(10.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              widget.iconData,
            ),
            Text(
              widget.text,
              maxLines: 2,
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 14.sp, height: 1.3),
            ),
            4.sbH,
          ],
        ),
      ),
    );
  }
}
