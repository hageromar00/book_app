import 'package:book_app/Features/home/presentation/views/splash/splash_view_body.dart';
import 'package:book_app/core/utils/const.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:
      Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image(
          image: AssetImage(
            AssestImage.logo,
          ),
        ),
       SplashViewBody()
      ],
    )
    );
  }
}
