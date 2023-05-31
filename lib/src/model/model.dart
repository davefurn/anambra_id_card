import 'package:acmc/src/constants/end_points.dart';

class EmployeeListModel {
  final String name;
  final String email;
  final String phone;
  final DateTime date;
  EmployeeListModel({
    required this.email,
    required this.name,
    required this.phone,
    required this.date,
  });

  EmployeeListModel fromJson(Map<String, dynamic> data) {
    return EmployeeListModel(
      email: data['email'],
      name: data['name'],
      phone: data['phone'],
      date: DateTime.parse(data['date']),
    );
  }
}

class StatisticsPair {
  final String name;
  final int value;

  StatisticsPair({
    required this.name,
    required this.value,
  });
}

class Departments {
  final int departmentId;
  final String departmentName;

  Departments({
    required this.departmentId,
    required this.departmentName,
  });

  static Departments fromJson(Map<String, dynamic> data) {
    return Departments(
      departmentId: data['department_id'],
      departmentName: data['department_name'],
    );
  }
}

class MdaLocation {
  final int locationId;
  final String locationName;

  MdaLocation({
    required this.locationId,
    required this.locationName,
  });

  static MdaLocation fromJson(Map<String, dynamic> data) {
    return MdaLocation(
      locationId: data['location_id'],
      locationName: data['location_name'],
    );
  }
}

class SearchModel {
  final int id;
  final String employeeId;
  final String firstName;
  final String lastName;
  final String middleName;
  final String profilePicture;
  final int isActive;
  final Departments departments;
  final MdaLocation mdaLocation;
  SearchModel({
    required this.id,
    required this.employeeId,
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.profilePicture,
    required this.isActive,
    required this.departments,
    required this.mdaLocation,
  });

  static SearchModel fromJson(Map<String, dynamic> data) {
    return SearchModel(
      id: data['id'],
      employeeId: data['employee_id'],
      firstName: data['first_name'],
      lastName: data['last_name'],
      middleName: data['middle_name'],
      isActive: data['is_active'],
      departments: Departments.fromJson(data['departments']),
      mdaLocation: MdaLocation.fromJson(data['mda_location']),
      profilePicture: AppEndpoints.pictureUrl + data['profile_picture'],
    );
  }
}

class NotificatinModel {
  final String title;
  final String message;

  NotificatinModel({
    required this.title,
    required this.message,
  });

  static NotificatinModel fromJson(Map<String, dynamic> data) {
    return NotificatinModel(
      title: data['title'],
      message: data['message'],
    );
  }
}
