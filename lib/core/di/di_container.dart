import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:test_app/core/services/github_api_service.dart';

final getIt = GetIt.instance;

Future<void> getItSetup() async {
  getIt.registerLazySingleton(() => Dio());

  getIt.registerLazySingleton(() => GitHubApiService(getIt()));
}
