import 'package:book_app/Features/home/data/model/book_model/book_model.dart';
import 'package:book_app/Features/home/domain/entity/book_entity.dart';
import 'package:book_app/core/error/fail.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchbook();
  Future<Either<Failure, List<BookEntity>>> newset();
  Future<Either<Failure, List<BookEntity>>> similar({required String category});
}

