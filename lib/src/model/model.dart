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

class Designation {
  final int designationId;
  final String designationName;

  Designation({
    required this.designationId,
    required this.designationName,
  });

  static Designation fromJson(Map<String, dynamic> data) {
    return Designation(
      designationId: data['designation_id'],
      designationName: data['designation_name'],
    );
  }
}
class Government {
  final int governmentId;
  final String governmentName;

  Government({
    required this.governmentId,
    required this.governmentName,
  });

  static Government fromJson(Map<String, dynamic> data) {
    return Government(
      governmentId: data['gov_id'],
      governmentName: data['name'],
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
  final String dateOfBirth;
  final String contactNo;
  final int isActive;
  final String email;
  final String gender;
  final String employeeType;
  final String dateOfJoining;
  final String dateOfLeaving;
  final String maritalStatus;
  final String basicSalary;
  final String grade;
  final String dataStatus;
  final String stateOfOrigin;
  final String verificationId;
  final String address;
  final String town;
  final String city;
  final String state;

  final Departments departments;
  final MdaLocation mdaLocation;
  final Designation designation;
  final Government government;
  SearchModel({
    required this.address,
    required this.town,
    required this.city,
    required this.state,
    required this.contactNo,
    required this.government,
    required this.verificationId,
    required this.designation,
    required this.basicSalary,
    required this.dateOfJoining,
    required this.dateOfLeaving,
    required this.maritalStatus,
    required this.grade,
    required this.dataStatus,
    required this.stateOfOrigin,
    required this.employeeType,
    required this.gender,
    required this.email,
    required this.dateOfBirth,
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
      address: data['address'],
      town: data['town'],
      city: data['city'],
      state: data['state'],
      contactNo: data['contact_no'],
      government: Government.fromJson(data['government']),
      verificationId: data['verification_id'],
      designation: Designation.fromJson(data['designation']),
      basicSalary: data['basic_salary'],
      dataStatus: data['data_status'],
      dateOfJoining: data['date_of_joining'],
      dateOfLeaving: data['date_of_leaving'],
      maritalStatus: data['marital_status'],
      grade: data['grade'],
      stateOfOrigin: data['state_of_origin'],
      employeeType: data['employee_type'],
      gender: data['gender'],
      email: data['email'],
      dateOfBirth: data['date_of_birth'],
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
