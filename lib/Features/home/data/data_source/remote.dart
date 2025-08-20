import 'package:book_app/Features/home/data/model/book_model/book_model.dart';
import 'package:book_app/Features/home/domain/entity/book_entity.dart';
import 'package:book_app/core/utils/api_service.dart';
import 'package:book_app/core/utils/const.dart';
import 'package:book_app/core/utils/save_local_data.dart';
import 'package:dartz/dartz.dart';
import 'package:hive_flutter/adapters.dart';

abstract class RemoteDate {
  Future<List<BookEntity>> fetchfeaturebookRemote();
  Future<List<BookEntity>> fetchNewestbookRemote();
  Future<List<BookEntity>> SimilarbookRemote({required String category});
}

class RemoteDateImpl implements RemoteDate {
  final ApiService apiservice;
  RemoteDateImpl(this.apiservice);
  @override
  Future<List<BookEntity>> fetchfeaturebookRemote() async {
    var data = await apiservice.getservice(
        endpoint: 'volumes?Filtering=free-ebooks&q=programming');
    List<BookEntity> book = [];
    for (var item in data["items"]) {
      book.add(BookModel.fromJson(item));
    }
    saveLocalDate(book, Kfetchbook);
    return book;
  }

  // void saveLocalDate(List<BookEntity> book) {
  //   var box = Hive.box<BookEntity>(Kfetchbook);
  //   box.addAll(book);
  // }

  @override
  Future<List<BookEntity>> fetchNewestbookRemote() async {
    var data = await apiservice.getservice(
        endpoint:
            'volumes?Filtering=free-ebooks&Sorting=newest &q=computer science');
    List<BookEntity> book = [];
    for (var item in data["items"]) {
      book.add(BookModel.fromJson(item));
    }
    saveLocalDate(book, Knewbook);
    return book;
  }
  
  @override
  Future<List<BookEntity>> SimilarbookRemote({required String category}) async{
  
      var data = await apiservice.getservice(
          endpoint: 'volumes?Filtering=free-ebooks&Sorting=relevence&q=computer science');
      List<BookModel> book = [];
      // print("start");
      for (var item in data['items']) {
        book.add(BookModel.fromJson(item));
      }
      // print("hi");
      saveLocalDate(book, Ksimbook);
      return book;
   
  }
  }

