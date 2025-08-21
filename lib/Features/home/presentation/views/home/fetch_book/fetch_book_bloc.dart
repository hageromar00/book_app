import 'package:book_app/Features/home/domain/entity/book_entity.dart';
import 'package:book_app/Features/home/presentation/view_model/fetch_book/fetchbook_cubit.dart';
import 'package:book_app/Features/home/presentation/views/home/fetch_book/fetch_book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchBookBloc extends StatefulWidget {
  const FetchBookBloc({super.key});

  @override
  State<FetchBookBloc> createState() => _FetchBookBlocState();
}

class _FetchBookBlocState extends State<FetchBookBloc> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchbookCubit,FetchbookState>(
      listener: (context, state) {
        if (state is FetchbookSuccess) {
          books.addAll(state.books);
        }
      },
      builder: (context, state) {
        if (state is FetchbookSuccess ||
            state is FeaturedBooksPaginationLoading) {
          return FetchBook(books: books,);
        } else if (state is FetchbookFail) {
          return Text(state.error);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
