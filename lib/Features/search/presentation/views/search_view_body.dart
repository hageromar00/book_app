import 'package:book_app/Features/search/presentation/view_model/search_cubit.dart';
import 'package:book_app/Features/search/presentation/views/widget/custom_text.dart';
import 'package:book_app/Features/search/presentation/views/widget/search_list_book.dart';
import 'package:book_app/core/utils/const.dart';
import 'package:book_app/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          CustomText(
            onSubmitted: (value) {
              BlocProvider.of<SearchCubit>(context).searchPage(title: value);
            },
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Search Result',
            style: Styles.textStyle30.copyWith(fontFamily: KGt),
          ),
          const SizedBox(
            height: 16,
          ),
          const Expanded(child: SearchListBook())
        ],
      ),
    );
  }
}
