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
