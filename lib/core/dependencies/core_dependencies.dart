part of 'app_dependencies.dart';

void coreDependencies() {
  inject.addSingleton<DataManager>(DataManager());
}
