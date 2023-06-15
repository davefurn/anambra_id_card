import 'package:acmc/src/features/visitor_management/appointment_ticket.dart';
import 'package:acmc/src/router/app_routes.dart';
import 'package:acmc/src/utils/extension/widget_extension.dart';
import 'package:acmc/src/widgets/special_button_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';

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
              SpecialButton2(
                height: 32.h,
                text: 'Employee',
                icon: const Icon(
                  Icons.person_outline,
                ),
              ),
              12.sbW,
              SpecialButton2(
                height: 32.h,
                text: 'MDA',
                icon: const Icon(
                  Icons.apartment_outlined,
                ),
              ),
              12.sbW,
              SpecialButton2(
                height: 32.h,
                backgroundColor: const Color(0xff010C20),
                textColor: IdColors.anotherWhite,
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
              onDateChanged: (date) {
                pushTo(context, const AppointmentTicket());
              },
            ),
          )
        ],
      ),
    );
  }
}
