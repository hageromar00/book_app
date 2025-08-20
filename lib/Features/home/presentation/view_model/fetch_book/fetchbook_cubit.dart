import 'package:bloc/bloc.dart';
import 'package:book_app/Features/home/data/model/book_model/book_model.dart';
import 'package:book_app/Features/home/domain/entity/book_entity.dart';
import 'package:book_app/Features/home/domain/repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'fetchbook_state.dart';

class FetchbookCubit extends Cubit<FetchbookState> {
  FetchbookCubit(this.homerepo) : super(FetchbookInitial());
  final HomeRepo homerepo;
  Future<void> FetchFeatureBook() async {
    emit(FetchbookLoad());
    var result = await homerepo.fetchbook();
    print('hhhhhhh iam in fetch book');
    result.fold((l) => emit(FetchbookFail(l.erormessage)),
        (books) => emit(FetchbookSuccess(books)));
  }
}
