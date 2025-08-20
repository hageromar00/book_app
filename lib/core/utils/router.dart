import 'package:book_app/Features/home/data/model/book_model/book_model.dart';
import 'package:book_app/Features/home/data/repo/home_repo_impl.dart';
import 'package:book_app/Features/home/domain/entity/book_entity.dart';
import 'package:book_app/Features/home/presentation/view_model/similar_book/similarbook_cubit.dart';
import 'package:book_app/Features/home/presentation/views/home/details_book/details_views.dart';
import 'package:book_app/Features/home/presentation/views/home/home_views.dart';
import 'package:book_app/Features/search/data/repo/search_repo.dart';
import 'package:book_app/Features/search/data/repo/search_repo_impl.dart';
import 'package:book_app/Features/search/presentation/view_model/search_cubit.dart';
import 'package:book_app/Features/search/presentation/views/search_view.dart';
import 'package:book_app/Features/home/presentation/views/splash/splish_view.dart';
import 'package:book_app/core/utils/api_service.dart';
import 'package:book_app/core/utils/get.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  // final GoRouter router = GoRouter(router);
  static const khome = '/homeview';
  static const ksimilar = '/similar';
  static const ksearch = '/search';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: khome,
      builder: (context, state) => const HomeViews(),
    ),
    GoRoute(
      path: ksimilar,
      builder: (context, state) => BlocProvider(
        create: (context) => SimilarbookCubit(getIt.get<HomeRepoImpl>()),
        child: DetailsViews(
          model: state.extra as BookEntity,
        ),
      ),
    ),
    GoRoute(
      path: ksearch,
      builder: (context, state) => BlocProvider(
        create: (context) => SearchCubit(getIt.get<SearchRepoImpl>()),
        child: SearchView(),
      ),
    )
  ]);
}
