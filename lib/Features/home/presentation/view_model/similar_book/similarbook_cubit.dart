import 'package:bloc/bloc.dart';
import 'package:book_app/Features/home/data/model/book_model/book_model.dart';
import 'package:book_app/Features/home/domain/repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'similarbook_state.dart';

class SimilarbookCubit extends Cubit<SimilarbookState> {
  SimilarbookCubit(this.homerepo) : super(SimilarbookInitial());
  final HomeRepo homerepo;
  Future<void> SimilarBooks({required String cate}) async {
    emit(SimilarbookLoad());
    var result = await homerepo.similar(category:cate );
    // print('similar');
    result.fold((l) => emit(SimilarbookIFail(l.erormessage)),
        (books) => emit(SimilarbookSuccess(books)));
  }
}
