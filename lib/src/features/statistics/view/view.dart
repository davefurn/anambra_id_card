import 'package:acmc/src/extension/size_config.dart';
import 'package:acmc/src/features/all_employees/widget/group_order.dart';
import 'package:acmc/src/features/statistics/widget/statistics_card.dart';
import 'package:acmc/src/model/model.dart';
import 'package:acmc/src/utils/extension/widget_extension.dart';
import 'package:acmc/src/widgets/special_button_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StatisticsView extends StatefulWidget {
  const StatisticsView({super.key});

  @override
  State<StatisticsView> createState() => _StatisticsViewState();
}

class _StatisticsViewState extends State<StatisticsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          textAlign: TextAlign.start,
          'Statistics',
          style:
              Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 24),
          maxLines: 1,
        ),
        centerTitle: false,
      ),
      body: ListView(
        padding: EdgeInsets.only(
          left: getProportionateScreenWidth(20),
          right: getProportionateScreenWidth(20),
          top: getProportionateScreenHeight(40),
        ),
        children: [
          DayOrdering(
            onSelected: (value) {},
          ),
          8.sbH,
          Wrap(
            children: [
              SpecialButton2(
                text: 'Select date',
                icon: SvgPicture.asset(
                  'assets/svgs/calendar.svg',
                ),
              ),
            ],
          ),
          28.sbH,
          StatisticsCard(
            title: 'SIGNUP METHOD',
            description: 'Most frequently used signup method by your employees',
            pairs: [
              StatisticsPair(
                name: 'Employee ID',
                value: 3,
              ),
              StatisticsPair(
                name: 'Email',
                value: 10,
              ),
              StatisticsPair(
                name: 'Phone number',
                value: 5,
              ),
            ],
          ),
          12.sbH,
          StatisticsCard(
            title: 'Login',
            description: 'Login activity of users entering the scanner app',
            pairs: [
              StatisticsPair(
                name: 'Attempted login',
                value: 34,
              ),
              StatisticsPair(
                name: 'Successful',
                value: 32,
              ),
              StatisticsPair(
                name: 'Unsuccessful',
                value: 1,
              ),
            ],
          ),
          12.sbH,
          StatisticsCard(
            title: 'Scan and search',
            description:
                'How many times were the scan and search methods used?',
            pairs: [
              StatisticsPair(
                name: 'QRCode ',
                value: 10,
              ),
              StatisticsPair(
                name: 'Manual search',
                value: 15,
              ),
              StatisticsPair(
                name: 'Unsuccessful',
                value: 17,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
