import 'package:book_app/Features/home/data/repo/home_repo_impl.dart';
import 'package:book_app/Features/search/data/repo/search_repo_impl.dart';
import 'package:book_app/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

// Alternatively you could write it if you don't like global variables
  GetIt.I
      .registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<SearchRepoImpl>(SearchRepoImpl(getIt.get<ApiService>()));
}
