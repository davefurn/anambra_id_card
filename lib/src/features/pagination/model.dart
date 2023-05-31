class PaginationModel {
  String word;
  int page;
  late int total;
  PaginationModel({
    this.total = 100,
    this.page = 1,
    this.word = '',
  });
}
