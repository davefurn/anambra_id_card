import 'package:acmc/src/constants/colors.dart';
import 'package:acmc/src/features/pagination/provider.dart';
import 'package:acmc/src/features/search/search_parameters/views/search_details.dart';
import 'package:acmc/src/model/model.dart';
import 'package:acmc/src/router/app_routes.dart';
import 'package:acmc/src/utils/extension/widget_extension.dart';
import 'package:acmc/src/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class EmployeeTile extends StatelessWidget {
  final EmployeeListModel? employeeData;
  final HistoryModel? historyModel;
  const EmployeeTile({
    super.key,
    this.employeeData,
    this.historyModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          employeeData != null
              ? employeeData!.name
              : (historyModel!.status == 'Exception' ||
                      historyModel!.firstName == null)
                  ? 'Failed search'
                  : historyModel!.firstName!.isEmpty
                      ? 'Unknown'
                      : '${historyModel!.lastName} ${historyModel!.firstName}',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 16,
                color: IdColors.textColorGrey,
              ),
        ),
        2.sbH,
        Text(
          employeeData != null
              ? employeeData!.email
              : 'Searched by ${historyModel!.identifierType}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontSize: 16,
                color: IdColors.textColorGrey,
              ),
        ),
        4.sbH,
        Text(
          employeeData != null
              ? employeeData!.phone
              : 'Searched for ${historyModel!.identifierValue}',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontSize: 16,
                color: IdColors.textColorGrey,
              ),
        ),
        4.sbH,
        if (historyModel != null)
          Column(
            children: [
              Text(
                'Searched on ${DateFormat('EEEE, MMM dd').format(historyModel!.searchTime)}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 16,
                      color: IdColors.textColorGrey,
                    ),
              ),
              4.sbH,
            ],
          ),
        if (employeeData != null || historyModel?.status != 'Exception')
          GestureDetector(
            onTap: () async {
              showDialog<SearchModel?>(
                context: context,
                builder: (context) {
                  return Dialog(
                    child: Consumer(
                      builder: (context, ref, child) {
                        var data = ref.watch(revisitProvider(historyModel!.id));
                        return data.when(
                          data: (value) {
                            if (value?.statusCode == 200 &&
                                value != null &&
                                value.data != null) {
                              Map<String, dynamic> convertedMap = {};
                              value.data.forEach((key, value) {
                                convertedMap[key] = value;
                              });
                              var newP = SearchModel.fromJson(convertedMap);
                              WidgetsBinding.instance
                                  .addPostFrameCallback((timeStamp) {
                                Navigator.of(context).pop(newP);
                              });
                              return const SizedBox.shrink();
                            } else {
                              return AppErrorWidget(
                                errorData: value?.data,
                              );
                            }
                          },
                          error: (error, trace) {
                            return AppErrorWidget(
                              error: error,
                            );
                          },
                          loading: () => SizedBox(
                            height: 40.h,
                            child: const CircularProgressIndicator.adaptive(),
                          ),
                        );
                      },
                    ),
                  );
                },
              ).then((value) {
                if (value != null) pushTo(context, SearchDetails(model: value));
              });
            },
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                'View details',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                      color: IdColors.textColorYellow,
                    ),
              ),
            ),
          ),
      ],
    );
  }
}
