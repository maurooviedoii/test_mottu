import 'package:flutter/material.dart';

import '../../app/domain/entity/character.dart';
import '../../app/presentation/detail_page.dart';
import '../../app/presentation/error_page.dart';
import '../../app/presentation/home_page.dart';
import '../../app/presentation/splash_page.dart';
import 'app_routes.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case AppRoutes.detail:
        late Character character;
        if (settings.arguments is Character) {
          character = settings.arguments as Character;
        }
        return MaterialPageRoute(builder: (_) => DetailPage(character: character));
      case AppRoutes.error:
        late ErrorPageArguments arguments;

        if (settings.arguments is ErrorPageArguments) {
          arguments = settings.arguments as ErrorPageArguments;
        }
        return MaterialPageRoute(
          builder: (_) => ErrorPage(
            errorPageArguments: arguments,
          ),
        );
      default:
        throw Exception("not implemented");
    }
  }
}
