import 'package:inject/inject.dart';
import 'package:mr_recipe/data/data.dart';
import 'package:mr_recipe/domain/domain.dart';
import 'package:mr_recipe/core/managers/data_manager.dart';
import 'package:mr_recipe/ui/screens/detail/bloc/recipe_detail_bloc.dart';
import 'package:mr_recipe/ui/screens/form/bloc/recipe_form_bloc.dart';
import 'package:mr_recipe/ui/screens/home/bloc/home_bloc.dart';

part 'bloc_dependencies.dart';
part 'core_dependencies.dart';
part 'datasource_dependencies.dart';
part 'repository_dependencies.dart';
part 'usescases_dependencies.dart';

final inject = Inject.instance;

abstract class AppDependencies {
  static void init() {
    coreDependencies();
    datasourceDependencies();
    repositoryDependencies();
    usescasesDependencies();
    blocDependencies();
  }
}
