
import 'package:book_app/core/utils/const.dart';
import 'package:book_app/core/utils/style.dart';
import 'package:flutter/material.dart';

class TextSlash extends StatelessWidget {
  const TextSlash({super.key, required this.animate});
  final Animation<Offset> animate;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animate,
      builder: (context, child) {
        return SlideTransition(
          position: animate,
          child: Center(
              child: Text(
            'Read the book',
            style: Styles.style20.copyWith(fontFamily: KGt),
          )),
        );
      },
      // child: Center(
      //         child: Text(
      //       'Read the book',
      //       style: Styles.style20.copyWith(fontFamily: KGt),
      //     )),
    );
  }
}
