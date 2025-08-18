import 'package:book_app/Features/home/presentation/views/home/newset_book/newset_views.dart';
import 'package:book_app/Features/search/presentation/view_model/search_cubit.dart';
import 'package:book_app/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchListBook extends StatelessWidget {
  const SearchListBook({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: state.book.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: NewsetItem(model: state.book[index]),
                );
              });
        } else if (state is SearchLoad) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SearchFail) {
          return const Center(
            child: Text('There is error here ,Check the internet'),
          );
        } else {
          return const SizedBox(
            child: Center(
              child: Text(
                'Start searching for books',
                style: Styles.textStyle20,
              ),
            ),
          );
        }
      },
    );
  }
}
