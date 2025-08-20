class BookEntity {
  final String bookId;
  final String? image;
  final String auther;
  final num? price;
  final num? count;

  BookEntity(
      {required this.bookId,required this.image,
      required this.auther,
      required this.price,
      required this.count});
}
