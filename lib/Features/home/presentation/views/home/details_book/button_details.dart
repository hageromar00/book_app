import 'package:book_app/Features/home/data/model/book_model/book_model.dart';
import 'package:book_app/Features/home/domain/entity/book_entity.dart';
import 'package:book_app/Features/home/presentation/views/home/details_book/custom_button.dart';
import 'package:book_app/core/utils/help_launch.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class ButtonDetails extends StatelessWidget {
  const ButtonDetails({super.key, required this.model});
  final BookEntity model;

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
//                 if (model.link != null &&model.link != 'no_link') {
//   final Uri url = Uri.parse(model.link!);
//   if (!await launchUrl(url)) {
//     throw Exception('Could not launch $url');
//   }
// } else {
//   print("❌ No preview link available for this book");
// }
                // print("Preview link from API: ${model.volumeInfo?.previewLink}");
                 launchCustomURL(context, model.previewLink);
                // launchCustomURL(context, model.volumeInfo!.previewLink!);
                // final Uri _url = Uri.parse(model.volumeInfo!.previewLink!);
                // if (!await launchUrl(_url)) {
                //   throw Exception('Could not launch $_url');
                // }
              },
              font: 16,
              backColor: const Color(0xffEF8262),
              textColor: Colors.white,
              text:'Previews',
              // text: getText(model),
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

  // String getText(BookEntity model) {
  //   if ((model.volumeInfo?.previewLink == null)) {
  //     return 'Not Available';
  //   } else {
  //     return 'Preview';
  //   }
  // }
}
