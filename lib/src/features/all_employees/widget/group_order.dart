import 'package:acmc/src/constants/colors.dart';
import 'package:acmc/src/model/enums.dart';
import 'package:acmc/src/utils/extension/string_extension.dart';
import 'package:acmc/src/widgets/special_button_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainEmployeeOrder extends StatefulWidget {
  final Function(NameAgeStatusOrder) onSelected;
  const MainEmployeeOrder({super.key, required this.onSelected});

  @override
  State<MainEmployeeOrder> createState() => _MainEmployeeOrderState();
}

class _MainEmployeeOrderState extends State<MainEmployeeOrder> {
  NameAgeStatusOrder value = NameAgeStatusOrder.name;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.w,
      children: [
        NameAgeStatusOrder.name,
        NameAgeStatusOrder.status,
      ]
          .map((e) => InkWell(
                onTap: () {
                  setState(() => value = e);
                  widget.onSelected(e);
                },
                child: SpecialButton2(
                  text: e.name.capitalize(),
                  backgroundColor: value == e ? IdColors.mainColor : null,
                  textColor: Colors.black,
                  borderColor: value == e ? Colors.transparent : null,
                ),
              ))
          .toList(),
    );
  }
}

class NameOrdering extends StatefulWidget {
  final Function(NameOrder) onSelected;
  const NameOrdering({
    super.key,
    required this.onSelected,
  });

  @override
  State<NameOrdering> createState() => _NameOrderingState();
}

class _NameOrderingState extends State<NameOrdering> {
  NameOrder value = NameOrder.aToZ;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.w,
      children: [NameOrder.aToZ, NameOrder.ztoA]
          .map((e) => InkWell(
                onTap: () {
                  setState(() => value = e);
                  widget.onSelected(e);
                },
                child: SpecialButton2(
                  text: e == NameOrder.aToZ ? 'A-Z' : 'Z-A',
                  backgroundColor: value == e ? Colors.black : null,
                  textColor: value == e ? null : IdColors.textColorBlack,
                  selectedTextColor: Colors.white,
                  borderColor: value == e ? Colors.transparent : null,
                ),
              ))
          .toList(),
    );
  }
}

class AgeOrdering extends StatefulWidget {
  final Function(AgeOrder) onSelected;
  const AgeOrdering({
    super.key,
    required this.onSelected,
  });

  @override
  State<AgeOrdering> createState() => _AgeOrderingState();
}

class _AgeOrderingState extends State<AgeOrdering> {
  AgeOrder value = AgeOrder.oldest;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.w,
      children: [AgeOrder.oldest, AgeOrder.yougest]
          .map((e) => InkWell(
                onTap: () {
                  setState(() => value = e);
                  widget.onSelected(e);
                },
                child: SpecialButton2(
                  text: 'From ${e.name}',
                  backgroundColor: value == e ? Colors.black : null,
                  textColor: value == e ? null : IdColors.textColorBlack,
                  selectedTextColor: Colors.white,
                  borderColor: value == e ? Colors.transparent : null,
                ),
              ))
          .toList(),
    );
  }
}

class StatusOrdering extends StatefulWidget {
  final Function(StatusOrder) onSelected;
  const StatusOrdering({
    super.key,
    required this.onSelected,
  });

  @override
  State<StatusOrdering> createState() => _StatusOrderingState();
}

class _StatusOrderingState extends State<StatusOrdering> {
  StatusOrder value = StatusOrder.active;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.w,
      children: [StatusOrder.active, StatusOrder.inactive]
          .map((e) => InkWell(
                onTap: () {
                  setState(() => value = e);
                  widget.onSelected(e);
                },
                child: SpecialButton2(
                  text: e.name.capitalize(),
                  backgroundColor: value == e ? Colors.black : null,
                  textColor: value == e ? null : IdColors.textColorBlack,
                  selectedTextColor: Colors.white,
                  borderColor: value == e ? Colors.transparent : null,
                ),
              ))
          .toList(),
    );
  }
}

class DayOrdering extends StatefulWidget {
  final Function(DayOrder) onSelected;
  const DayOrdering({
    super.key,
    required this.onSelected,
  });

  @override
  State<DayOrdering> createState() => _DayOrderingState();
}

class _DayOrderingState extends State<DayOrdering> {
  DayOrder value = DayOrder.today;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.w,
      children:
          [DayOrder.today, DayOrder.thisWeek, DayOrder.thisMonth].map((e) {
        late String text;

        switch (e) {
          case DayOrder.today:
            text = 'Today';
            break;
          case DayOrder.thisWeek:
            text = 'This Week';
            break;
          case DayOrder.thisMonth:
            text = 'This Month';
            break;
          default:
        }
        return InkWell(
          onTap: () {
            setState(() => value = e);
            widget.onSelected(e);
          },
          child: SpecialButton2(
            text: text,
            backgroundColor: value == e ? IdColors.mainColor : null,
            borderColor: value == e ? Colors.transparent : null,
          ),
        );
      }).toList(),
    );
  }
}
