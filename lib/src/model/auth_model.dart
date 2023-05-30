class VerifiedUserData {
  final String staffId;
  final String firstName;
  final String lastName;
  final String email;
  final String mobile;

  VerifiedUserData({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.staffId,
    required this.mobile,
  });

  static VerifiedUserData fromJson(Map<String, dynamic> data) {
    return VerifiedUserData(
      email: data['email'],
      firstName: data['first_name'],
      lastName: data['last_name'],
      staffId: data['staff_id'],
      mobile: data['mobile_number'],
    );
  }
}

class EmployeeData {
  final String profilePicture;
  final int isActive;

  EmployeeData({
    required this.isActive,
    required this.profilePicture,
  });

  static EmployeeData fromJson(Map<String, dynamic> data) {
    return EmployeeData(
      isActive: data['is_active'],
      profilePicture: data['profile_picture'],
    );
  }
}

class UserData {
  final int id;
  final String staffId;
  final String firstName;
  final String lastName;
  final String email;
  final String role;
  final String status;
  final String phone;

  UserData({
    required this.email,
    required this.firstName,
    required this.id,
    required this.lastName,
    required this.role,
    required this.staffId,
    required this.status,
    required this.phone,
  });

  static UserData fromJson(Map<String, dynamic> data) {
    return UserData(
      email: data['email'],
      firstName: data['first_name'],
      id: data['id'],
      lastName: data['last_name'],
      role: data['role'],
      staffId: data['staff_id'],
      status: data['status'],
      phone: data['mobile_number'],
    );
  }
}

class LoginData {
  final String accessToken;
  final String department;
  final String designation;
  final UserData userData;
  final EmployeeData employeeData;

  LoginData({
    required this.accessToken,
    required this.employeeData,
    required this.userData,
    required this.department,
    required this.designation,
  });

  static LoginData fromJson(Map<String, dynamic> data) {
    return LoginData(
      employeeData: EmployeeData.fromJson(data['employee_data']),
      userData: UserData.fromJson(data['user']),
      accessToken: data['access_token'],
      department: data['department'],
      designation: data['designation'],
    );
  }
}
