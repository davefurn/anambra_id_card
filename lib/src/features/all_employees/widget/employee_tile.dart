import 'package:acmc/src/constants/colors.dart';
import 'package:acmc/src/constants/end_points.dart';
import 'package:acmc/src/features/search/search_parameters/views/search_details.dart';
import 'package:acmc/src/model/model.dart';
import 'package:acmc/src/router/app_routes.dart';
import 'package:acmc/src/utils/extension/widget_extension.dart';
import 'package:flutter/material.dart';

class EmployeeTile extends StatelessWidget {
  final EmployeeListModel data;
  const EmployeeTile({
    super.key,
    required this.data,
  });

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
            InkWell(
              onTap: () => {
                pushTo(
                  context,
                  SearchDetails(
                    model: SearchModel(
                      id: 1,
                      employeeId: '13100014',
                      firstName: 'firstName',
                      lastName: 'firstName',
                      middleName: 'middleName',
                      profilePicture:
                          '${AppEndpoints.pictureUrl}profile_1591286690.jpg',
                      departments: Departments(
                        departmentId: 1,
                        departmentName: 'departmentName',
                      ),
                      isActive: 1,
                      mdaLocation: MdaLocation(
                        locationId: 1,
                        locationName: 'locationName',
                      ),
                      basicSalary: '740000',
                      dataStatus: 'Complete',
                      dateOfBirth: '1982-11-09',
                      dateOfJoining: '2014-03-03',
                      dateOfLeaving: '2042-11-09',
                      email: 'jamesngannou@gmail.com',
                      employeeType: 'Regular staff',
                      gender: 'Male',
                      grade: '12-CV/9',
                      maritalStatus: 'Married',
                      stateOfOrigin: 'Anambra',
                      contactNo: '08084646545',
                      designation: Designation(
                        designationId: 1,
                        designationName: 'Engr',
                      ),
                      government: Government(
                          governmentId: 1, governmentName: 'Anambra State'),
                      verificationId: '1290378734', address: 'amawbia', city: 'Awka', state: 'Anambra State', town: 'Amawbia',
                    ),
                  ),
                )
              },
              child: Text(
                'View details',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                      color: IdColors.textColorYellow,
                    ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
