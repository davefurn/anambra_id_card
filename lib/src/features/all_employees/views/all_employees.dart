import 'package:acmc/src/constants/colors.dart';
import 'package:acmc/src/extension/size_config.dart';
import 'package:acmc/src/utils/extension/widget_extension.dart';
import 'package:acmc/src/widgets/special_button_2.dart';
import 'package:flutter/material.dart';

class AllEmployee extends StatefulWidget {
  const AllEmployee({super.key});

  @override
  State<AllEmployee> createState() => _AllEmployeeState();
}

class _AllEmployeeState extends State<AllEmployee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All employees (50)',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: 24,
              ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: getProportionateScreenWidth(20),
          right: getProportionateScreenWidth(20),
          top: getProportionateScreenWidth(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: getProportionateScreenWidth(8),
              children: ['Name', 'Age', 'Status']
                  .map((e) => SpecialButton2(
                        text: e,
                      ))
                  .toList(),
            ),
            8.sbH,
            Wrap(
              spacing: getProportionateScreenWidth(8),
              children: ['Ascending', 'Descending']
                  .map((e) => SpecialButton2(
                        text: e,
                      ))
                  .toList(),
            ),
            30.sbH,
            Text(
              '50 Results',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                    color: IdColors.textColorGrey,
                  ),
            ),
            18.sbH,
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => const EmployeeTile(),
                separatorBuilder: (context, index) => const Divider(
                  color: IdColors.textColorGrey,
                  thickness: 1,
                  height: 20,
                ),
                itemCount: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class EmployeeTile extends StatelessWidget {
  const EmployeeTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'James Ngannou',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 16,
                color: IdColors.textColorGrey,
              ),
        ),
        2.sbH,
        Text(
          'jamesngannou@gmail.com',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontSize: 16,
                color: IdColors.textColorGrey,
              ),
        ),
        2.sbH,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '08084646545',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 16,
                    color: IdColors.textColorGrey,
                  ),
            ),
            Text(
              'View details',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                    color: IdColors.textColorYellow,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
