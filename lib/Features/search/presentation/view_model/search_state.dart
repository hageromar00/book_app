part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoad extends SearchState {}

class SearchSuccess extends SearchState {
  final List<BookModel> book;
  SearchSuccess(this.book);
}

class SearchFail extends SearchState {
  final String error;
  SearchFail(this.error);
}
