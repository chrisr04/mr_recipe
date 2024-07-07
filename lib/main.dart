import 'package:flutter/material.dart';
import 'package:mr_recipe/core/core.dart';
import 'package:mr_recipe/ui/ui.dart';

void main() {
  initDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.home,
      onGenerateRoute: RouteGenerator.onGenerateRoutes,
      theme: theme,
    );
  }
}
