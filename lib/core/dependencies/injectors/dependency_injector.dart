import 'package:flutter/material.dart';
import 'package:mr_recipe/core/dependencies/core_dependencies/core_dependencies.dart';
import 'package:mr_recipe/core/dependencies/datasource_dependencies/datasource_dependencies.dart';
import 'package:mr_recipe/core/dependencies/repository_dependencies/repository_dependencies.dart';
import 'package:mr_recipe/core/dependencies/bloc_dependencies/bloc_dependencies.dart';
import 'package:mr_recipe/core/dependencies/usescases_dependencies/usescases_dependencies.dart';

class DependencyInjector extends StatelessWidget {
  const DependencyInjector({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CoreDependencies(
      child: DataSourceDependencies(
        child: RepositoryDependencies(
          child: UsesCasesDependencies(
            child: BlocDependencies(
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
