import 'package:bloc/bloc.dart';
import 'package:book_app/Features/home/data/model/book_model/book_model.dart';
import 'package:book_app/Features/search/data/repo/search_repo.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;
  Future<void> searchPage({required String title}) async {
    emit(SearchLoad());
    var result = await searchRepo.SearchBook(title: title);
    result.fold(
      (l) => emit(SearchFail(l.erormessage)),
      (books) => emit(
        SearchSuccess(books),
      ),
    );
  }
}
