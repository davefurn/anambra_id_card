import 'package:acmc/src/constants/colors.dart';
import 'package:acmc/src/features/all_employees/widget/employee_tile.dart';
import 'package:acmc/src/features/all_employees/widget/group_order.dart';
import 'package:acmc/src/model/enums.dart';
import 'package:acmc/src/riverpod/providers.dart';
import 'package:acmc/src/utils/extension/widget_extension.dart';
import 'package:acmc/src/widgets/no_access.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllEmployee extends ConsumerStatefulWidget {
  final bool hasAccess;
  const AllEmployee({
    super.key,
    this.hasAccess = true,
  });

  @override
  ConsumerState<AllEmployee> createState() => _AllEmployeeState();
}

class _AllEmployeeState extends ConsumerState<AllEmployee> {
  NameAgeStatusOrder order = NameAgeStatusOrder.name;

  @override
  Widget build(BuildContext context) {
    var employee = ref.watch(fetchEmployeeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All employees',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: 24,
              ),
        ),
      ),
      body: widget.hasAccess
          ? Padding(
              padding: EdgeInsets.only(
                left: 20.h,
                right: 20.w,
                top: 30.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainEmployeeOrder(
                    onSelected: (value) => setState(() => order = value),
                  ),
                  8.sbH,
                  if (order == NameAgeStatusOrder.name)
                    NameOrdering(
                      onSelected: (value) {},
                    )
                  else
                    StatusOrdering(
                      onSelected: (value) {},
                    ),
                  30.sbH,
                  Expanded(
                    child: employee.when(
                      data: (data) => Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${data.length} Results',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontSize: 14,
                                    color: IdColors.textColorGrey,
                                  ),
                            ),
                          ),
                          18.sbH,
                          Expanded(
                            child: ListView.separated(
                              itemBuilder: (context, index) =>
                                  EmployeeTile(data: data[index]),
                              separatorBuilder: (context, index) =>
                                  const Divider(
                                color: IdColors.textColorGrey,
                                thickness: 1,
                                height: 20,
                              ),
                              itemCount: data.length,
                            ),
                          ),
                        ],
                      ),
                      error: (error, trace) => const Text('Error'),
                      loading: () => const Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    ),
                  )
                ],
              ),
            )
          : const NoAccess(),
    );
  }
}
