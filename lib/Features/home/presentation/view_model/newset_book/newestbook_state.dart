part of 'newestbook_cubit.dart';

@immutable
abstract class NewestbookState {}

class NewestbookInitial extends NewestbookState {}

class NewestbookLoad extends NewestbookState {}

class NewestbookSuccess extends NewestbookState {
  final List<BookModel> books;
  NewestbookSuccess(this.books);
}

class NewestbookFail extends NewestbookState {
  final String error;
  NewestbookFail(this.error);
}
