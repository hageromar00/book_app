import 'package:book_app/Features/home/domain/entity/book_entity.dart';
import 'package:book_app/core/utils/const.dart';
import 'package:hive_flutter/adapters.dart';

abstract class LocalData {
  List<BookEntity> fetchfeaturebookLocal({int pageNumber = 0});
  List<BookEntity> fetchNewestbookLocal();
  List<BookEntity> fetchSiimilarbookLocal();
}

class LocalDataImpl implements LocalData {
  @override
  List<BookEntity> fetchNewestbookLocal() {
    var boxx = Hive.box<BookEntity>(Knewbook);
    return boxx.values.toList();
  }

  @override
  List<BookEntity> fetchfeaturebookLocal({int pageNumber = 0}) {
       final startIndex = pageNumber * 10;//0
    final endIndex = startIndex + 10;//10
  var box = Hive.box<BookEntity>(Kfetchbook);
   final books = box.values.toList();
    return books.sublist(
      startIndex,
      endIndex > books.length ? books.length : endIndex,
    );
    //    var boxx = Hive.box<BookEntity>(Kfetchbook);
    // return boxx.values.toList();
  }
  
  @override
  List<BookEntity> fetchSiimilarbookLocal() {
   var boxx = Hive.box<BookEntity>(Ksimbook);
    return boxx.values.toList();
  }
}
