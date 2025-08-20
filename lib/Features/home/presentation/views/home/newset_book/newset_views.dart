import 'package:book_app/Features/home/data/model/book_model/book_model.dart';
import 'package:book_app/Features/home/domain/entity/book_entity.dart';
import 'package:book_app/Features/home/presentation/views/home/widget/Custom_image.dart';
import 'package:book_app/Features/home/presentation/views/home/widget/rating.dart';
import 'package:book_app/core/utils/const.dart';
import 'package:book_app/core/utils/router.dart';
import 'package:book_app/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewsetItem extends StatelessWidget {
  const NewsetItem({super.key, required this.model});
  final BookEntity model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.ksimilar,extra: model);
      },
      child: SizedBox(
        height: 140,
        child: Row(
          children: [
            CustomImage(
              image: model.image??'',
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * .5,
                    child: Text(
                      model.title ??'',
                      style: Styles.style20.copyWith(fontFamily: KGt),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    model.auther ??'',
                    style: Styles.textStyle18.copyWith(color: Colors.grey),
                     maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                   Row(
                    children: [
                    const  Text(r'$19.9', style: Styles.style20),
                    const  Spacer(),
                      Rating(rating: model.rate!
                      ,
                      count:model.count! ,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
