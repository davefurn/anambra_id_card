import 'package:acmc/src/features/visitor_management/appointment_request.dart';
import 'package:acmc/src/features/visitor_management/confirm_token.dart';
import 'package:acmc/src/features/visitor_management/schedule_appointment.dart';
import 'package:acmc/src/features/visitor_management/widget.dart';
import 'package:acmc/src/router/app_routes.dart';
import 'package:acmc/src/utils/extension/widget_extension.dart';
import 'package:flutter/material.dart';

class VisitorManagement extends StatefulWidget {
  const VisitorManagement({super.key});

  @override
  State<VisitorManagement> createState() => _VisitorManagementState();
}

class _VisitorManagementState extends State<VisitorManagement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          textAlign: TextAlign.start,
          'Visitor management',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: 24,
              ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          VisitorHomeCard(
            svg: 'special_scan',
            text: 'Confirm a token',
            onTap: () => pushTo(context, const ConfirmToken()),
          ),
          16.sbH,
          VisitorHomeCard(
            svg: 'request',
            text: 'Appointment requests',
            onTap: () => pushTo(context, const AppointmentRequests()),
          ),
          16.sbH,
          VisitorHomeCard(
            svg: 'appointment',
            text: 'Schedule appointment',
            onTap: () => pushTo(context, const ScheduleAppointment()),
          ),
          80.sbH,
        ],
      ),
    );
  }
}
