import 'package:book_app/Features/home/data/model/book_model/book_model.dart';
import 'package:book_app/Features/home/presentation/views/home/details_book/button_details.dart';
import 'package:book_app/Features/home/presentation/views/home/details_book/details_book_section.dart';
import 'package:book_app/Features/home/presentation/views/home/details_book/similar_book.dart';
import 'package:flutter/material.dart';

class DetailsBookBody extends StatelessWidget {
  const DetailsBookBody({super.key,required this.model});
  final BookModel model;

  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              DetailsBookSection(model: model,),
             ButtonDetails(model:model,),
            const  SizedBox(
                height: 15,
              ),
             const SimilarBook()
            ],
          ),
        )
      ],
    );
  }
}
