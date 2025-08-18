import 'package:book_app/Features/home/presentation/views/home/fetch_book/fetch_book.dart';
import 'package:book_app/Features/home/presentation/views/home/newset_book/newset_list.dart';
import 'package:book_app/Features/home/presentation/views/home/widget/custom_appbar.dart';
import 'package:book_app/core/utils/style.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              FetchBook(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                child: Text(
                  'Newset Book',
                  style: Styles.textStyle30,
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
        SliverFillRemaining(
          child: NewsetList(),
        )
      ],
    );
  }
}
