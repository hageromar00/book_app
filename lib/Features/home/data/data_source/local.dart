import 'package:book_app/Features/home/domain/entity/book_entity.dart';
import 'package:book_app/core/utils/const.dart';
import 'package:hive_flutter/adapters.dart';

abstract class LocalData {
  List<BookEntity> fetchfeaturebookLocal();
  List<BookEntity> fetchNewestbookLocal();
}

class LocalDataImpl implements LocalData {
  @override
  List<BookEntity> fetchNewestbookLocal() {
    var boxx = Hive.box<BookEntity>(Knewbook);
    return boxx.values.toList();
  }

  @override
  List<BookEntity> fetchfeaturebookLocal() {
       var boxx = Hive.box<BookEntity>(Kfetchbook);
    return boxx.values.toList();
  }
}
