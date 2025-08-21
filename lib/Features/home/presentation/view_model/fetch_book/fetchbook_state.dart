part of 'fetchbook_cubit.dart';

@immutable
abstract class FetchbookState {}

class FetchbookInitial extends FetchbookState {}

class FetchbookLoad extends FetchbookState {}

class FetchbookSuccess extends FetchbookState {
  final List<BookEntity> books;

  FetchbookSuccess( this.books);
  
}
class FeaturedBooksPaginationLoading extends FetchbookState  {}

class FeaturedBooksPaginationFailure extends FetchbookState {
  final String errMessage;

  FeaturedBooksPaginationFailure(this.errMessage);
}
class FetchbookFail extends FetchbookState {
  final String error;

  FetchbookFail(this.error);
}
