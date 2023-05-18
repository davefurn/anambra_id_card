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