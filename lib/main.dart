import 'package:book_app/Features/home/data/repo/home_repo_impl.dart';
import 'package:book_app/Features/home/domain/entity/book_entity.dart';
import 'package:book_app/Features/home/presentation/view_model/fetch_book/fetchbook_cubit.dart';
import 'package:book_app/Features/home/presentation/view_model/newset_book/newestbook_cubit.dart';
import 'package:book_app/core/utils/const.dart';
import 'package:book_app/core/utils/get.dart';
import 'package:book_app/core/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
    await Hive.initFlutter();
  await Hive.openBox<BookEntity>(Kfetchbook);
  await Hive.openBox<BookEntity>(Knewbook);
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              NewestbookCubit(getIt.get<HomeRepoImpl>())..NewestBookss(),
        ),
        BlocProvider(
          create: (context) =>
              FetchbookCubit(getIt.get<HomeRepoImpl>())..FetchFeatureBook(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark),
        routerConfig: AppRouter.router,
        // home: SplashView(),
      ),
    );
  }
}
