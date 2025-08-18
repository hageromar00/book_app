import 'package:book_app/core/utils/style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.onPressed,
      required this.backColor,
      required this.textColor,
      required this.text,
      this.font,
      required this.border});
  final Function()? onPressed;
  final Color backColor;
  final Color textColor;
  final String text;
  final BorderRadius border;
  final double? font;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 43,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: backColor,
            shape: RoundedRectangleBorder(borderRadius: border)),
        child: Text(
          text,
          style: Styles.textStyle18.copyWith(
            color: textColor,
            fontSize: font,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
    // TextButton(
    //   onPressed: onPressed,
    //   style: TextButton.styleFrom(
    //       backgroundColor: backColor,
    //       shape: RoundedRectangleBorder(borderRadius: border)),
    //   child: Text(
    //     text,
    //     style: Styles.textStyle14.copyWith(color: textColor),
    //   ),
    // );
  }
}
