 import 'package:book_app/Features/home/domain/entity/book_entity.dart';
import 'package:book_app/core/utils/const.dart';
import 'package:hive/hive.dart';

void saveLocalDate(List<BookEntity> book,String name) {
    var box = Hive.box<BookEntity>(name);
    box.addAll(book);
  }