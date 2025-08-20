import 'package:bloc/bloc.dart';
import 'package:book_app/Features/home/data/model/book_model/book_model.dart';
import 'package:book_app/Features/home/domain/repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'newestbook_state.dart';

class NewestbookCubit extends Cubit<NewestbookState> {
  NewestbookCubit(this.homerepo) : super(NewestbookInitial());
  final HomeRepo homerepo;
  Future<void> NewestBookss() async {
    emit(NewestbookLoad());
    // print('new');
    var result = await homerepo.newset();
    //  print(' in news book');
    result.fold(
      (l) => emit(NewestbookFail(l.erormessage)),
      (books) => emit(NewestbookSuccess(books)),
    );
    // print('t');
  }
}
