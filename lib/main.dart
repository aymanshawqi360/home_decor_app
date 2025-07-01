import 'package:flutter/material.dart';
import 'package:home_decor_app/core/di/dependency_injection.dart';
import 'package:home_decor_app/core/routes/app_router.dart';
import 'package:home_decor_app/home_decor_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  runApp(HomeDecorApp(AppRouter()));
}
