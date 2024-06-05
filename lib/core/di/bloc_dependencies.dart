part of 'di.dart';

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

class HomeBlocDependency extends InheritedWidget {
  const HomeBlocDependency({
    super.key,
    required super.child,
    required this.create,
  });

  final HomeBloc Function(BuildContext context) create;

  static HomeBloc of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<HomeBlocDependency>()!
      .create(context);

  @override
  bool updateShouldNotify(HomeBlocDependency oldWidget) => false;
}

class RecipeFormBlocDependency extends InheritedWidget {
  const RecipeFormBlocDependency({
    super.key,
    required super.child,
    required this.create,
  });

  final RecipeFormBloc Function(BuildContext context) create;

  static RecipeFormBloc of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<RecipeFormBlocDependency>()!
      .create(context);

  @override
  bool updateShouldNotify(RecipeFormBlocDependency oldWidget) => false;
}

class RecipeDetailBlocDependency extends InheritedWidget {
  const RecipeDetailBlocDependency({
    super.key,
    required super.child,
    required this.create,
  });

  final RecipeDetailBloc Function(BuildContext context) create;

  static RecipeDetailBloc of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<RecipeDetailBlocDependency>()!
      .create(context);

  @override
  bool updateShouldNotify(RecipeDetailBlocDependency oldWidget) => false;
}

class BlocInjector<T> extends InheritedWidget {
  const BlocInjector({
    super.key,
    required this.bloc,
    required super.child,
  });

  final T bloc;

  static T of<T>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BlocInjector<T>>()!.bloc;
  }

  @override
  bool updateShouldNotify(BlocInjector<T> oldWidget) => false;
}
