import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:home_decor_app/core/networks/dio_factory.dart';
import 'package:home_decor_app/features/favorite/data/api/favorite_api_service.dart';
import 'package:home_decor_app/features/favorite/data/repo_implementation/favorite_repo_implementation.dart';
import 'package:home_decor_app/features/favorite/domain/repo/favorite_repo.dart';
import 'package:home_decor_app/features/favorite/domain/use_cases/favorite_api_use_cases.dart';
import 'package:home_decor_app/features/favorite/presentation/cubit/cubit/favorite_cubit.dart';
import 'package:home_decor_app/features/home/data/apis/home_api_service.dart';
import 'package:home_decor_app/features/home/data/repo_implementation/home_repo_implementation.dart';
import 'package:home_decor_app/features/home/domain/repo/home_repo.dart';
import 'package:home_decor_app/features/home/domain/use_cases/best_seller_use_cases.dart';
import 'package:home_decor_app/features/home/domain/use_cases/categories_use_cases.dart';
import 'package:home_decor_app/features/home/domain/use_cases/new_collection_use_cases.dart';
import 'package:home_decor_app/features/home/domain/use_cases/slider_use_cases.dart';
import 'package:home_decor_app/features/home/presentation/cubit/best_seller/best_seller_cubit.dart';
import 'package:home_decor_app/features/home/presentation/cubit/categories/categories_cubit.dart';
import 'package:home_decor_app/features/home/presentation/cubit/cubit/slider_cubit.dart';
import 'package:home_decor_app/features/home/presentation/cubit/new_collection/new_collection_cubit.dart';
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
  //!Core
  Dio dio = DioFactory.getDio();
  //!Data Layer
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<LoginApiService>(() => LoginApiService(dio));
  getIt.registerLazySingleton<SearchApiService>(() => SearchApiService(dio));
  getIt.registerLazySingleton<SignUpApiService>(() => SignUpApiService(dio));
  getIt.registerLazySingleton<FavoriteApiService>(
    () => FavoriteApiService(dio),
  );

  //!Repo Layer
  getIt.registerLazySingleton<SearchRepo>(
    () => SearchRepoImplementation(getIt()),
  );
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepoImplementation(getIt()));
  getIt.registerLazySingleton<SignUpRepo>(() => RepoImplementation(getIt()));
  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepoImplementation(getIt()),
  );
  getIt.registerLazySingleton<FavoriteRepo>(
    () => FavoriteRepoImplementation(favoriteApiService: getIt()),
  );

  //!UseCases
  getIt.registerLazySingleton<LoginUseCase>(() => LoginUseCase(getIt()));
  getIt.registerLazySingleton<SignUpUseCases>(() => SignUpUseCases(getIt()));
  getIt.registerLazySingleton<BestSellerUseCases>(
    () => BestSellerUseCases(getIt()),
  );
  getIt.registerLazySingleton<CategoriesUseCases>(
    () => CategoriesUseCases(getIt()),
  );
  getIt.registerLazySingleton<SliderUseCases>(() => SliderUseCases(getIt()));
  getIt.registerLazySingleton<NewCollectionUseCases>(
    () => NewCollectionUseCases(getIt()),
  );
  getIt.registerLazySingleton<SearchUseCases>(() => SearchUseCases(getIt()));
  getIt.registerLazySingleton<FavoriteApiUseCases>(
    () => FavoriteApiUseCases(favoriteRepo: getIt()),
  );

  //!Bloc

  getIt.registerFactory(() => SliderCubit(sliderUseCases: getIt()));
  getIt.registerFactory(() => CategoriesCubit(getIt()));
  getIt.registerFactory(() => BestSellerCubit(getIt()));
  getIt.registerFactory(() => NewCollectionCubit(getIt()));
  getIt.registerFactory(() => FavoriteCubit(favoriteApiUseCases: getIt()));
}
