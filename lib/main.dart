import 'package:flutter/material.dart';
import 'package:mr_recipe/core/core.dart';
import 'package:mr_recipe/ui/ui.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DependencyInjector(
      child: MaterialApp(
        initialRoute: AppRoutes.home,
        onGenerateRoute: onGenerateRoutes,
        theme: theme,
      ),
    );
  }
}
