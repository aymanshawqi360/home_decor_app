import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor_app/core/di/dependency_injection.dart';
import 'package:home_decor_app/core/helper/app_bloc_ob_server.dart';
import 'package:home_decor_app/core/helper/extensions.dart';
import 'package:home_decor_app/core/networks/api_constants.dart';
import 'package:home_decor_app/core/helper/app_string.dart';
import 'package:home_decor_app/core/networks/save_the_token.dart';
import 'package:home_decor_app/core/routes/app_router.dart';
import 'package:home_decor_app/home_decor_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  setupGetIt();
  Bloc.observer = AppBlocObserver();
  await checkIfloggedInUser();
  runApp(HomeDecorApp(AppRouter()));
}

checkIfloggedInUser() async {
  String? user = await SaveTheToken.getData(Token.accesToken.name);
  if (user.isNullOrEmp()) {
    AppString.isLoggedInUser = false;
  } else {
    AppString.isLoggedInUser = true;
  }
}
