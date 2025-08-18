part of 'similarbook_cubit.dart';

@immutable
abstract class SimilarbookState {}

class SimilarbookInitial extends SimilarbookState {}

class SimilarbookLoad extends SimilarbookState {}

class SimilarbookSuccess extends SimilarbookState {
  final List<BookModel> books;
  SimilarbookSuccess(this.books);
}

class SimilarbookIFail extends SimilarbookState {
  final String error;

  SimilarbookIFail(this.error);
}
