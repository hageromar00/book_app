import 'package:book_app/core/utils/const.dart';
import 'package:book_app/core/utils/router.dart';
import 'package:book_app/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animControl;
  late Animation<Offset> animate;
  @override
  void initState() {
    initanimate();
    Navigat();
    super.initState();
  }

  void Navigat() {
    Future.delayed(const Duration(milliseconds: 1500), () {
      GoRouter.of(context).push(AppRouter.khome);
    });
  }

  void initanimate() {
    animControl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    animate = Tween<Offset>(begin: const Offset(0, 10), end: const Offset(0, 0))
        .animate(animControl);
    animControl.forward();
  }

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
    );
    //  SplashViewBody()
  }
}
