import 'package:book_app/Features/home/data/model/book_model/book_model.dart';
import 'package:book_app/core/error/fail.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchbook();
  Future<Either<Failure, List<BookModel>>> newset();
  Future<Either<Failure, List<BookModel>>> similar({required String category});
}

