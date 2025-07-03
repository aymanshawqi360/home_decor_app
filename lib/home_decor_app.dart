import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_decor_app/core/routes/app_router.dart';
import 'package:home_decor_app/core/routes/routes.dart';
import 'package:home_decor_app/core/theme/colors.dart';

class HomeDecorApp extends StatelessWidget {
  final AppRouter _appRouter;
  const HomeDecorApp(this._appRouter, {super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,

      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Home Decor App',

          theme: ThemeData(
            scaffoldBackgroundColor: ColorsMananger.white,
            appBarTheme: AppBarTheme(color: ColorsMananger.white),
            // textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          initialRoute: Routes.login,
          onGenerateRoute: _appRouter.generateRoute,
        );
      },
    );
  }
}
