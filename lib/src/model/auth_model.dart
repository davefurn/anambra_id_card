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
