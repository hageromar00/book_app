import 'package:book_app/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Rating extends StatelessWidget {
  const Rating(
      {super.key,
      this.main = MainAxisAlignment.start,
      required this.count,
      required this.rating});
  final MainAxisAlignment main;
  final dynamic rating;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: main,
      children: [
        // Icon(FontAwesomeIcons.solidHeart)
        const Icon(
          FontAwesomeIcons.solidHeart,
          color: Colors.yellow,
        ),
        const SizedBox(
          width: 6.3,
        ),
        Text(
          rating.toString(),
          style: Styles.textStyle16,
        ),
        const SizedBox(
          width: 6.3,
        ),
        Opacity(
          opacity: .5,
          child: Text(
            '($count)',
            // style: Styles.textStyle14.copyWith(color: const Color(0xff707070)),
            style: Styles.textStyle14,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
      ],
    );
  }
}
