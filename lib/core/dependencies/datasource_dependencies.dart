part of 'app_dependencies.dart';

void datasourceDependencies() {
  inject.addSingleton<RecipeLocalDataSource>(
    RecipeLocalDataSource(
      dataManager: inject<DataManager>(),
    ),
  );
}
