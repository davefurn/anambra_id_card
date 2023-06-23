import 'package:acmc/src/constants/consts.dart';
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

  static EmployeeListModel fromJson(Map<String, dynamic> data) {
    return EmployeeListModel(
      email: data['identifier_value'],
      name: data['name'] ?? 'Chiaza',
      phone: data['phone'] ?? '080343390101',
      date: DateTime(
        DateTime.parse(data['search_time']).year,
        DateTime.parse(data['search_time']).month,
        DateTime.parse(data['search_time']).day,
      ),
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

class GuestSearchModel {
  final int userId;
  final String employeeId;
  final String firstName;
  final String lastName;
  final String profilePicture;
  final bool isActive;
  final Departments departments;
  final Designation designation;

  GuestSearchModel({
    required this.userId,
    required this.employeeId,
    required this.firstName,
    required this.lastName,
    required this.profilePicture,
    required this.isActive,
    required this.departments,
    required this.designation,
  });

  factory GuestSearchModel.fromJson(Map<String, dynamic> data) {
    return GuestSearchModel(
      userId: data['user_id'],
      employeeId: data['employee_id'],
      firstName: data['first_name'],
      lastName: data['last_name'],
      profilePicture: AppEndpoints.pictureUrl + data['profile_picture'],
      isActive: data['is_active'] == 1,
      designation: Designation.fromJson(data['designation']),
      departments: Departments.fromJson(data['department']),
    );
  }
}

class SearchModel {
  final String id;
  final String employeeId;
  final String firstName;
  final String lastName;
  final String middleName;
  final String profilePicture;
  final String dateOfBirth;
  final String contactNo;
  int isActive;
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
  final String searchingUserRole;
  final String? emailResponse;

  final Departments? departments;
  final Designation? designation;
  final MdaLocation? mdaLocation;
  final Government? government;
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
    required this.searchingUserRole,
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
    this.emailResponse,
  });

  static SearchModel fromJson(Map<String, dynamic> data) {
    // print(data['searchingUserRole']);
    return SearchModel(
      address: data['address'],
      town: data['town'],
      city: data['city'],
      state: data['state'],
      searchingUserRole: data['searchingUserRole'],
      contactNo: data['contact_no'],
      verificationId: data['verification_id'],
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
      emailResponse: data['emailResponse'],
      designation: AppConstants.role.contains(data['searchingUserRole'])
          ? Designation.fromJson(data['designation'])
          : null,
      departments: AppConstants.role.contains(data['searchingUserRole'])
          ? Departments.fromJson(data['departments'])
          : null,
      government: AppConstants.role.contains(data['searchingUserRole'])
          ? Government.fromJson(data['government'])
          : null,
      mdaLocation: AppConstants.role.contains(data['searchingUserRole'])
          ? MdaLocation.fromJson(data['mda_location'])
          : null,
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

class LoginSearchedList {
  final int id;
  final String employeeId;
  final String identifierType;
  final String identifierValue;
  final DateTime searchTime;
  final String status;
  final String searchParams;

  LoginSearchedList({
    required this.id,
    required this.employeeId,
    required this.identifierType,
    required this.identifierValue,
    required this.searchTime,
    required this.status,
    required this.searchParams,
  });

  factory LoginSearchedList.fromJson(Map<String, dynamic> data) {
    return LoginSearchedList(
      id: data['id'],
      employeeId: data['employee_id'],
      identifierType: data['identifier_type'],
      identifierValue: data['identifier_value'],
      searchTime: DateTime.parse(data['search_time']),
      status: data['status'],
      searchParams: data['search_params'],
    );
  }
}

class EmployeeHistoryData {
  final String employeeId;
  final int userId;

  EmployeeHistoryData({
    required this.employeeId,
    required this.userId,
  });

  factory EmployeeHistoryData.fromJson(Map<String, dynamic> data) {
    return EmployeeHistoryData(
      employeeId: data['employee_id'],
      userId: data['user_id'],
    );
  }
}

class HistoryModel {
  final int id;
  final String employeeId;
  final String identifierType;
  final String identifierValue;
  final String? firstName;
  final String? lastName;
  final DateTime searchTime;
  final String status;
  final EmployeeHistoryData employeeData;

  HistoryModel({
    required this.id,
    required this.employeeId,
    required this.identifierType,
    required this.identifierValue,
    required this.firstName,
    required this.lastName,
    required this.searchTime,
    required this.status,
    required this.employeeData,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> data) {
    return HistoryModel(
      id: data['id'],
      employeeId: data['employee_id'],
      identifierType: data['identifier_type'],
      identifierValue: data['identifier_value'],
      firstName: data['first_name'],
      lastName: data['last_name'],
      searchTime: DateTime(
        DateTime.parse(data['search_time']).year,
        DateTime.parse(data['search_time']).month,
        DateTime.parse(data['search_time']).day,
      ),
      status: data['status'],
      employeeData: EmployeeHistoryData.fromJson(data['employee_data']),
    );
  }
}

class EmployeePaginationModel {
  String word;
  String identifier;
  int page;
  bool? asGuest;
  late int total;
  EmployeePaginationModel({
    this.total = 100,
    this.page = 1,
    this.word = '',
    this.asGuest,
    this.identifier = '',
  });
}
