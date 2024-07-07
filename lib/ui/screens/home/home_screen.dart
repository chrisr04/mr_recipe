import 'package:flutter/material.dart';
import 'package:mr_recipe/core/core.dart';
import 'package:mr_recipe/domain/domain.dart';
import 'package:mr_recipe/ui/common/common.dart';
import 'package:mr_recipe/ui/common/utils/bloc/widgets/bloc_injector.dart';
import 'package:mr_recipe/ui/navigation/app_routes.dart';
import 'package:mr_recipe/ui/screens/home/bloc/home_bloc.dart';

part 'widgets/home_view.dart';
part 'widgets/home_header.dart';
part 'widgets/home_recipe_list.dart';
part 'widgets/recipe_item.dart';
part 'widgets/add_recipe_button.dart';
part 'widgets/error_message.dart';
part 'widgets/empty_message.dart';
part 'widgets/recipe_item_property.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocInjector<HomeBloc>(
      bloc: inject<HomeBloc>()
        ..add(const LoadRecipesEvent())
        ..add(const WatchRecipesEvent()),
      child: const HomeView(),
    );
  }
}
