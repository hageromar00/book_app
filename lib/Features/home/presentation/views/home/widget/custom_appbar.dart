import 'package:book_app/core/utils/const.dart';
import 'package:book_app/core/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            AssestImage.logo,
            height: 18,
          ),
          IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.ksearch);
              },
              icon: const Icon(
                size: 30,
                Icons.search,
              ))
          // Icon(FontAwesomeIcons.solidHand)
        ],
      ),
    );
  }
}
