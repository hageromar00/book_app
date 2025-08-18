import 'package:book_app/Features/home/data/model/book_model/book_model.dart';
import 'package:book_app/Features/search/data/repo/search_repo.dart';
import 'package:book_app/core/error/fail.dart';
import 'package:book_app/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> SearchBook(
      {required String title}) async {
    try {
      var data = await apiService.getservice(
          endpoint:
              'volumes?Filtering=free-ebooks&q=subject:$title&sorting=newest');
      List<BookModel> book = [];
      // print('yyyyyyy1111');
      for (var item in data['items']) {
        book.add(BookModel.fromJson(item));
        // print('yyyyyy222222');
      }
      return right(book);
    } on Exception catch (e) {
      return left(Failure(erormessage: e.toString()));
    }
  }
}
