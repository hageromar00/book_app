import 'package:hive/hive.dart';
part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String? bookId;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final String? auther;
  @HiveField(3)
  final String? title;
  @HiveField(4)
  final num? rate;
  @HiveField(5)
  final num? count;
  @HiveField(6)
  final String? categories;
  @HiveField(7)
  final String? previewLink;

  BookEntity(
      {required this.title,
      required this.bookId,
      required this.categories,
      required this.image,
      required this.auther,
      required this.rate,
      required this.previewLink,
      required this.count});
}
