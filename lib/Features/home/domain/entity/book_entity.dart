
class BookEntity {
  final String bookId;
  final String? image;
  final String auther;
  final String title;
  final num? rate;
  final num? count;

  BookEntity(
      {required this.title,
      required this.bookId,
      required this.image,
      required this.auther,
      required this.rate,
      required this.count});
}
