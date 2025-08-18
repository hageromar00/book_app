import 'package:book_app/core/utils/snak_bar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchCustomURL(context, String url) async {
  if(url !=null){
    final Uri _url = Uri.parse(url);
  if (!await launchUrl(_url)) {
    customSnakBar(context, 'can not $url');
  } else {
    await launchUrl(_url);
  }
  }
 
}

