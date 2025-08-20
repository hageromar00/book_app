import 'package:book_app/Features/home/data/data_source/local.dart';
import 'package:book_app/Features/home/data/data_source/remote.dart';
import 'package:book_app/Features/home/data/model/book_model/book_model.dart';
import 'package:book_app/Features/home/domain/entity/book_entity.dart';
import 'package:book_app/Features/home/domain/repo/home_repo.dart';
import 'package:book_app/core/error/fail.dart';
import 'package:book_app/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo {
  final RemoteDate remotedata;
  final LocalData localdata;
  HomeRepoImpl({required this.localdata, required this.remotedata});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchbook() async {
    List<BookEntity> booklist;
    try {
      booklist = await localdata.fetchfeaturebookLocal();
      if (booklist.isNotEmpty) {
        return right(booklist);
      }
      booklist = await remotedata.fetchfeaturebookRemote();
      return right(booklist);
    } catch (e) {
      return left(Failure(erormessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> newset() async{
      List<BookEntity> booklist;
    try {
      booklist = await localdata.fetchNewestbookLocal();
      if (booklist.isNotEmpty) {
        return right(booklist);
      }
      booklist = await remotedata.fetchNewestbookRemote();
      return right(booklist);
    } catch (e) {
      return left(Failure(erormessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> similar({required String category})async {
     List<BookEntity> booklist;
    try {
      booklist = await localdata.fetchNewestbookLocal();
      if (booklist.isNotEmpty) {
//          print("Preview link from API: ${booklist[0].link}");
//              for (var b in booklist) {
//   print("Book title: ${b.title}");
//   print("Preview link: ${b.link}");
// }
        return right(booklist);
      }
      booklist = await remotedata.fetchNewestbookRemote();
        // print("Prev API: ${booklist[0].link}");
    
      return right(booklist);
    } catch (e) {
      return left(Failure(erormessage: e.toString()));
    }
  }
}

// class HomeRepoImpl implements HomeRepo {
//   final ApiService apiservice;

//   HomeRepoImpl(this.apiservice);

//   @override
//   Future<Either<Failure, List<BookModel>>> fetchbook() async {
//     try {
//       var data = await apiservice.getservice(
//           endpoint: 'volumes?Filtering=free-ebooks&q=programming');
//       List<BookModel> book = [];
//       // print("✅ API Response: $data");
//       for (var item in data['items']) {
//         book.add(BookModel.fromJson(item));
//       }
//       // print("📚 Number of books: ${book.length}");
//       return right(book);
//     } on Exception catch (e) {
//       return left(Failure(erormessage: e.toString()));
//     }
//   }

//   @override
//   Future<Either<Failure, List<BookModel>>> newset() async {
//     try {
//       var data = await apiservice.getservice(
//           endpoint:
//               'volumes?Filtering=free-ebooks&Sorting=newest &q=computer science');
//       List<BookModel> books = [];
//       for (var item in data['items']) {
//         try {
//           books.add(BookModel.fromJson(item));
//           // print('ok');
//         } catch (e) {
//           books.add(BookModel.fromJson(item));
//           // print('not ok');
//         }
//       }
      
//       //  print("sssNumber of books: ${books.length}");
//       return right(books);
       
//     } on Exception catch (e) {
//       return left(Failure(erormessage: e.toString()));
//     }
//   }

//   @override
//   Future<Either<Failure, List<BookModel>>> similar(
//       {required String category}) async {
//     try {
//       var data = await apiservice.getservice(
//           endpoint: 'volumes?Filtering=free-ebooks&Sorting=relevence&q=computer science');
//       List<BookModel> book = [];
//       // print("start");
//       for (var item in data['items']) {
//         book.add(BookModel.fromJson(item));
//       }
//       // print("hi");
//       return right(book);
//     } on Exception catch (e) {
//       return left(Failure(erormessage: e.toString()));
//     }
//   }
// }
