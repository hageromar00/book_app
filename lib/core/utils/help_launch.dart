import 'package:book_app/core/utils/snak_bar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Future<void> launchCustomURL(context, String url) async {
//   if(url !=null){
//     final Uri _url = Uri.parse(url);
//   if (!await launchUrl(_url)) {
//     customSnakBar(context, 'can not $url');
//   } else {
//     await launchUrl(_url);
//   }
//   }
 
// }


// Future<void> launchCustomURL(BuildContext context, String? url) async {
//   if (url == null || url.isEmpty) {
//     customSnakBar(context, 'Link not available');
//     return;
//   }

//   final Uri uri = Uri.parse(url);

//   if (await canLaunchUrl(uri)) {
//     await launchUrl(
//       uri,
//       mode: LaunchMode.externalApplication, // يفتح في المتصفح
//     );
//   } else {
//     customSnakBar(context, 'Cannot open $url');
//   }
// }

// Future<void> launchCustomURL(BuildContext context, String? url) async {
//   if (url == null || url.isEmpty) {
//     customSnakBar(context, 'Link not available');
//     return;
//   }

//   // 👇 استبدل http بـ https
//   if (url.startsWith('http://')) {
//     url = url.replaceFirst('http://', 'https://');
//   }

//   final Uri uri = Uri.parse(url);

//   if (await canLaunchUrl(uri)) {
//     await launchUrl(
//       uri,
//       mode: LaunchMode.externalApplication,
//     );
//   } else {
//     customSnakBar(context, 'Cannot open $url');
//   }
// } 

Future<void> launchCustomURL(context, String? url) async {
  if (url == null || url.isEmpty) {
    customSnakBar(context, 'Link not available');
    return;
  }

  final Uri uri = Uri.parse(url);

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    customSnakBar(context, 'Cannot open link');
  }
}