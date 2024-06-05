import 'package:flutter/material.dart';
import 'package:mr_recipe/ui/screens/detail/bloc/recipe_detail_bloc.dart';
import 'package:mr_recipe/ui/screens/form/bloc/recipe_form_bloc.dart';
import 'package:mr_recipe/ui/screens/home/bloc/home_bloc.dart';
import 'package:mr_recipe/core/dependencies/usescases_dependencies/usescases_dependencies.dart';

part 'home_bloc_dependency.dart';
part 'recipe_form_bloc_dependency.dart';
part 'recipe_detail_bloc_dependency.dart';

class BlocDependencies extends StatelessWidget {
  const BlocDependencies({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return HomeBlocDependency(
      create: (context) => HomeBloc(
        RecipeUsesCasesDependency.of(context).getRecipesUseCase,
        RecipeUsesCasesDependency.of(context).getRecipeWatcherUseCase,
        RecipeUsesCasesDependency.of(context).closeRecipeWatcherUseCase,
      ),
      child: RecipeFormBlocDependency(
        create: (context) => RecipeFormBloc(
          RecipeUsesCasesDependency.of(context).getRecipeByIdUseCase,
          RecipeUsesCasesDependency.of(context).createRecipeUseCase,
          RecipeUsesCasesDependency.of(context).updateRecipeUseCase,
        ),
        child: RecipeDetailBlocDependency(
          create: (context) => RecipeDetailBloc(
            RecipeUsesCasesDependency.of(context).getRecipeByIdUseCase,
            RecipeUsesCasesDependency.of(context).deleteRecipeUseCase,
          ),
          child: child,
        ),
      ),
    );
  }
}
