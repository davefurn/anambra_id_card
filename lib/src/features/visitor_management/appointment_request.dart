import 'package:acmc/src/utils/extension/widget_extension.dart';
import 'package:acmc/src/widgets/special_button_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentRequests extends StatefulWidget {
  const AppointmentRequests({super.key});

  @override
  State<AppointmentRequests> createState() => _AppointmentRequestsState();
}

class _AppointmentRequestsState extends State<AppointmentRequests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          textAlign: TextAlign.start,
          'Appointment requests',
          style:
              Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 24),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 32.h, left: 20.w, right: 20.w),
        children: [
          Row(
            children: [
              const SpecialButton2(
                text: 'Employee',
                icon: Icon(
                  Icons.person_outline,
                ),
              ),
              12.sbW,
              const SpecialButton2(
                text: 'MDA',
                icon: Icon(
                  Icons.apartment_outlined,
                ),
              ),
              12.sbW,
              const SpecialButton2(
                text: 'All',
              ),
            ],
          ),
          20.sbH,
          Container(
            decoration: BoxDecoration(
              color: const Color(0xffFFF8EB),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: CalendarDatePicker(
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(const Duration(days: 10 * 365)),
              onDateChanged: (date) {},
            ),
          )
        ],
      ),
    );
  }
}
