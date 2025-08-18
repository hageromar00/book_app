import 'package:book_app/Features/home/data/model/book_model/book_model.dart';
import 'package:book_app/Features/home/presentation/views/home/details_book/custom_button.dart';
import 'package:book_app/core/utils/help_launch.dart';
import 'package:flutter/material.dart';
class ButtonDetails extends StatelessWidget {
  const ButtonDetails({super.key, required this.model});
  final BookModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              onPressed: () {},
              backColor: Colors.white,
              textColor: Colors.black,
              text: r'$19.9',
              border: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () async {
                launchCustomURL(context, model.volumeInfo!.previewLink!);
                // final Uri _url = Uri.parse(model.volumeInfo!.previewLink!);
                // if (!await launchUrl(_url)) {
                //   throw Exception('Could not launch $_url');
                // }
              },
              font: 16,
              backColor: const Color(0xffEF8262),
              textColor: Colors.white,
              text: getText(model),
              border: const BorderRadius.only(
                bottomRight: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
          )
        ],
      ),
    );
  }

  String getText(BookModel model) {
    if ((model.volumeInfo?.previewLink == null)) {
      return 'Not Available';
    } else {
      return 'Preview';
    }
  }
}
