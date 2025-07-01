import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:home_decor_app/core/networks/dio_factory.dart';
import 'package:home_decor_app/features/login/data/api/login_api_service.dart';
import 'package:home_decor_app/features/login/data/repo_implementation/repo_implementation.dart';
import 'package:home_decor_app/features/login/domain/repo/login_repo.dart';
import 'package:home_decor_app/features/login/domain/usecase/login_use_case.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();
  //Login
  getIt.registerLazySingleton<LoginApiService>(() => LoginApiService(dio));
  getIt.registerLazySingleton<LoginRepo>(() => RepoImplementation(getIt()));
  getIt.registerLazySingleton<LoginUseCase>(() => LoginUseCase(getIt()));
}
