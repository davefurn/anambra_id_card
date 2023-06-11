import 'dart:math';

import 'package:acmc/src/constants/colors.dart';
import 'package:acmc/src/features/all_employees/widget/employee_tile.dart';
import 'package:acmc/src/model/model.dart';
import 'package:acmc/src/utils/extension/widget_extension.dart';
import 'package:acmc/src/widgets/no_access.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchMDAScreen extends StatefulWidget {
  final bool hasAccess;
  const SearchMDAScreen({
    super.key,
    this.hasAccess = true,
  });

  @override
  State<SearchMDAScreen> createState() => _SearchMDAScreenState();
}

class _SearchMDAScreenState extends State<SearchMDAScreen> {
  late List<EmployeeListModel> data;

  @override
  void initState() {
    super.initState();
    data = List.generate(
      10,
      (index) {
        final randomDuration = Duration(days: Random().nextInt(60));
        final randomDate = DateTime.now().add(randomDuration);
        return EmployeeListModel(
          email: 'gabriel@gmail.com',
          name: 'Ekene Gabriel',
          phone: '08034339010',
          date: DateTime(
            DateTime.now().year,
            randomDate.month,
            randomDate.day,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search MDA\'s',
          style:
              Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 24),
          maxLines: 1,
        ),
      ),
      body: widget.hasAccess
          ? Padding(
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
                top: 30.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Choose an MDA',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp,
                    ),
                  ),
                  8.sbH,
                  const DropdownMenu(
                    selectedTrailingIcon: Icon(
                      Icons.keyboard_arrow_down,
                    ),
                    trailingIcon: Icon(
                      Icons.keyboard_arrow_down,
                    ),
                    dropdownMenuEntries: [
                      DropdownMenuEntry(
                        value: 1,
                        label: 'All employees on payroll',
                      ),
                      DropdownMenuEntry(
                        value: 2,
                        label: 'Ministry of Health',
                      ),
                      DropdownMenuEntry(
                        value: 3,
                        label: 'ICT Agency',
                      ),
                      DropdownMenuEntry(
                        value: 5,
                        label: 'Ministry of Health',
                      ),
                    ],
                  ),
                  20.sbH,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '9000 employees',
                      ),
                      Icon(
                        Icons.search,
                      )
                    ],
                  ),
                  20.sbH,
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) =>
                          EmployeeTile(data: data[index]),
                      separatorBuilder: (context, index) => const Divider(
                        color: IdColors.textColorGrey,
                        thickness: 1,
                        height: 20,
                      ),
                      itemCount: data.length,
                    ),
                  ),
                ],
              ),
            )
          : const NoAccess(),
    );
  }
}
