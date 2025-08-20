import 'package:book_app/Features/home/data/model/book_model/book_model.dart';
import 'package:book_app/Features/home/domain/repo/home_repo.dart';
import 'package:book_app/core/error/fail.dart';
import 'package:book_app/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiservice;

  HomeRepoImpl(this.apiservice);

  @override
  Future<Either<Failure, List<BookModel>>> fetchbook() async {
    try {
      var data = await apiservice.getservice(
          endpoint: 'volumes?Filtering=free-ebooks&q=programming');
      List<BookModel> book = [];
      // print("✅ API Response: $data");
      for (var item in data['items']) {
        book.add(BookModel.fromJson(item));
      }
      // print("📚 Number of books: ${book.length}");
      return right(book);
    } on Exception catch (e) {
      return left(Failure(erormessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> newset() async {
    try {
      var data = await apiservice.getservice(
          endpoint:
              'volumes?Filtering=free-ebooks&Sorting=newest &q=computer science');
      List<BookModel> books = [];
      for (var item in data['items']) {
        try {
          books.add(BookModel.fromJson(item));
          // print('ok');
        } catch (e) {
          books.add(BookModel.fromJson(item));
          // print('not ok');
        }
      }
      
      //  print("sssNumber of books: ${books.length}");
      return right(books);
       
    } on Exception catch (e) {
      return left(Failure(erormessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> similar(
      {required String category}) async {
    try {
      var data = await apiservice.getservice(
          endpoint: 'volumes?Filtering=free-ebooks&Sorting=relevence&q=computer science');
      List<BookModel> book = [];
      // print("start");
      for (var item in data['items']) {
        book.add(BookModel.fromJson(item));
      }
      // print("hi");
      return right(book);
    } on Exception catch (e) {
      return left(Failure(erormessage: e.toString()));
    }
  }
}
