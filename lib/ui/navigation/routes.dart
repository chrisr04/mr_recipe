import 'package:flutter/material.dart';
import 'package:mr_recipe/ui/screens/detail/detail_screen.dart';
import 'package:mr_recipe/ui/screens/form/form_screen.dart';
import 'package:mr_recipe/ui/screens/home/home_screen.dart';
import 'package:mr_recipe/ui/screens/not_found/not_found_screen.dart';

class AppRoutes {
  static const home = '/';
  static const detail = '/detail';
  static const form = '/form';
}

MaterialPageRoute<dynamic> onGenerateRoutes(RouteSettings settings) =>
    MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => switch (settings.name) {
        AppRoutes.home => const HomeScreen(),
        AppRoutes.detail => DetailScreen(
            recipeId: getArgs<String>(
              settings.arguments,
              defaultValue: '',
            ),
          ),
        AppRoutes.form => FormScreen(
            recipeId: getArgs<String>(
              settings.arguments,
              defaultValue: '',
            ),
          ),
        _ => const NotFoundScreen(),
      },
    );

T getArgs<T>(Object? args, {required T defaultValue}) =>
    args != null ? args as T : defaultValue;
