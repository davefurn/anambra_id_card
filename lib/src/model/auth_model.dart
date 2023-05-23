class RegisterUser {
  /*
  "staff_id": "bnbnbnbn",
  "first_name": "success",
  "last_name": "onyegbanokwu",
  "email": "successonyegbanokwu@gmail.com",
  "mobile_number": "07012518127",
  "role": "guest",
  "id": 3
  */
  final String staffId;
  final String firstName;
  final String lastName;
  final String email;
  final String mobileNumber;
  final String role;
  final int id;

  RegisterUser({
    required this.email,
    required this.firstName,
    required this.id,
    required this.lastName,
    required this.mobileNumber,
    required this.role,
    required this.staffId,
  });

  static RegisterUser fromMap(Map<String, dynamic> data) {
    return RegisterUser(
      email: data['email'],
      firstName: data['first_name'],
      id: data['id'],
      lastName: data['last_name'],
      mobileNumber: data['mobile_number'],
      role: data['role'],
      staffId: data['staff_id'],
    );
  }
}
