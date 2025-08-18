import 'package:book_app/Features/home/data/model/book_model/book_model.dart';
import 'package:book_app/Features/home/presentation/views/home/details_book/custom_app_details.dart';
import 'package:book_app/Features/home/presentation/views/home/widget/Custom_image.dart';
import 'package:book_app/Features/home/presentation/views/home/widget/rating.dart';
import 'package:book_app/core/utils/const.dart';
import 'package:book_app/core/utils/style.dart';
import 'package:flutter/material.dart';

class DetailsBookSection extends StatelessWidget {
  const DetailsBookSection({super.key,required this.model});
  final BookModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppDetails(),
        SizedBox(
          height: MediaQuery.of(context).size.height * .4,
          child: CustomImage(
            image: model.volumeInfo?.imageLinks?.thumbnail ??'',
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Text(
          model.volumeInfo!.title!,
          style: Styles.textStyle20.copyWith(fontFamily: KGt),
        ),
        const SizedBox(
          height: 3,
        ),
        Opacity(
          opacity: .8,
          child: Text(
            model.volumeInfo!.authors![0],
            style: Styles.textStyle14.copyWith(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
         Rating(
          rating: model.volumeInfo?.averageRating?.round(),
          count: model.volumeInfo!.pageCount!,
          main: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
