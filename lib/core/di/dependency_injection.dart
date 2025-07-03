import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:home_decor_app/core/networks/dio_factory.dart';
import 'package:home_decor_app/features/home/data/apis/home_api_service.dart';
import 'package:home_decor_app/features/home/data/repo_implementation/home_repo_implementation.dart';
import 'package:home_decor_app/features/home/domain/repo/home_repo.dart';
import 'package:home_decor_app/features/home/domain/use_cases/best_seller_use_cases.dart';
import 'package:home_decor_app/features/home/domain/use_cases/categories_use_cases.dart';
import 'package:home_decor_app/features/home/domain/use_cases/new_collection_use_cases.dart';
import 'package:home_decor_app/features/home/domain/use_cases/slider_use_cases.dart';
import 'package:home_decor_app/features/login/data/api/login_api_service.dart';
import 'package:home_decor_app/features/login/data/repo_implementation/repo_implementation.dart';
import 'package:home_decor_app/features/login/domain/repo/login_repo.dart';
import 'package:home_decor_app/features/login/domain/usecase/login_use_case.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepoImplementation(getIt()));

  //Slider
  getIt.registerLazySingleton<SliderUseCases>(() => SliderUseCases(getIt()));
  //Categories
  getIt.registerLazySingleton<CategoriesUseCases>(
    () => CategoriesUseCases(getIt()),
  );
  //Best-Seller
  getIt.registerLazySingleton<BestSellerUseCases>(
    () => BestSellerUseCases(getIt()),
  );

  //NewCollection
  getIt.registerLazySingleton<NewCollectionUseCases>(
    () => NewCollectionUseCases(getIt()),
  );
  //Login
  getIt.registerLazySingleton<LoginApiService>(() => LoginApiService(dio));
  getIt.registerLazySingleton<LoginRepo>(() => RepoImplementation(getIt()));
  getIt.registerLazySingleton<LoginUseCase>(() => LoginUseCase(getIt()));
}
