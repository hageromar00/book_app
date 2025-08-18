import 'package:book_app/Features/home/data/model/book_model/book_model.dart';
import 'package:book_app/core/error/fail.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookModel>>> SearchBook({required String title});
}
