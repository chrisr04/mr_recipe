import 'package:flutter/material.dart';
import 'package:mr_recipe/core/core.dart';
import 'package:mr_recipe/data/data.dart';
import 'package:mr_recipe/domain/domain.dart';
import 'package:mr_recipe/ui/screens/detail/bloc/recipe_detail_bloc.dart';
import 'package:mr_recipe/ui/screens/form/bloc/recipe_form_bloc.dart';
import 'package:mr_recipe/ui/screens/home/bloc/home_bloc.dart';

part 'core_dependencies.dart';
part 'datasource_dependencies.dart';
part 'repository_dependencies.dart';
part 'usescases_dependencies.dart';
part 'bloc_dependencies.dart';

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
