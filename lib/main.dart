import 'package:flutter/material.dart';
import 'package:teste_mottu/core/di/di.dart';
import 'package:teste_mottu/core/utils/app_theme.dart';

import 'core/route/app_router.dart';
import 'core/route/app_routes.dart';

void main() async {
  await initDi();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Mottu',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
