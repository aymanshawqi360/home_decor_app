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
import 'package:home_decor_app/features/login/data/repo_implementation/login_repo_implementation.dart';
import 'package:home_decor_app/features/login/domain/repo/login_repo.dart';
import 'package:home_decor_app/features/login/domain/usecase/login_use_case.dart';
import 'package:home_decor_app/features/search/data/api/search_api_service.dart';
import 'package:home_decor_app/features/search/data/repo_implementation/search_repo_implementation.dart';
import 'package:home_decor_app/features/search/domain/repo/search_repo.dart';
import 'package:home_decor_app/features/search/domain/use_cases/search_use_cases.dart';
import 'package:home_decor_app/features/sign_up_screen/data/api/sign_up_api_service.dart';
import 'package:home_decor_app/features/sign_up_screen/data/repo_implementation/login_repo_implementation.dart';
import 'package:home_decor_app/features/sign_up_screen/domain/repo/sign_up_repo.dart';
import 'package:home_decor_app/features/sign_up_screen/domain/use_cases/sign_up_use_cases.dart';

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

  //SignUp

  getIt.registerLazySingleton<SignUpApiService>(() => SignUpApiService(dio));
  getIt.registerLazySingleton<SignUpRepo>(() => RepoImplementation(getIt()));
  getIt.registerLazySingleton<SignUpUseCases>(() => SignUpUseCases(getIt()));

  //Login

  getIt.registerLazySingleton<LoginApiService>(() => LoginApiService(dio));
  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepoImplementation(getIt()),
  );
  getIt.registerLazySingleton<LoginUseCase>(() => LoginUseCase(getIt()));

  //Search
  getIt.registerLazySingleton<SearchApiService>(() => SearchApiService(dio));
  getIt.registerLazySingleton<SearchRepo>(
    () => SearchRepoImplementation(getIt()),
  );
  getIt.registerLazySingleton<SearchUseCases>(() => SearchUseCases(getIt()));
}
