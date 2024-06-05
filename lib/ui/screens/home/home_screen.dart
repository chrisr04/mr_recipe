import 'package:flutter/material.dart';
import 'package:mr_recipe/core/core.dart';
import 'package:mr_recipe/domain/domain.dart';
import 'package:mr_recipe/ui/common/common.dart';
import 'package:mr_recipe/ui/navigation/routes.dart';
import 'package:mr_recipe/ui/screens/home/bloc/home_bloc.dart';

part 'widgets/header.dart';
part 'widgets/recipe_list.dart';
part 'widgets/recipe_item.dart';
part 'widgets/add_recipe_button.dart';
part 'widgets/error_message.dart';
part 'widgets/empty_message.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = HomeBlocDependency.of(context);
    return BlocInjector<HomeBloc>(
      bloc: homeBloc
        ..events.add(const LoadRecipesEvent())
        ..events.add(const WatchRecipesEvent()),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final _homeBloc = BlocInjector.of<HomeBloc>(context);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HomeHeader(),
            HomeRecipeList(),
          ],
        ),
      ),
      floatingActionButton: AddRecipeButton(),
    );
  }

  @override
  void dispose() {
    _homeBloc.events.add(const UnwatchRecipesEvent());
    _homeBloc.dispose();
    super.dispose();
  }
}
