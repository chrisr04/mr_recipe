import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mr_recipe/core/core.dart';
import 'package:mr_recipe/domain/domain.dart';
import 'package:mr_recipe/ui/common/common.dart';
import 'package:mr_recipe/ui/navigation/navigation.dart';
import 'package:mr_recipe/ui/theme/theme.dart';
import 'package:mr_recipe/ui/screens/detail/bloc/recipe_detail_bloc.dart';

part 'helpers/detail_helpers.dart';
part 'widgets/detail_view.dart';
part 'widgets/recipe_content.dart';
part 'widgets/detail_error_message.dart';
part 'widgets/row_buttons.dart';
part 'widgets/delete_confirmation_modal.dart';
part 'widgets/recipe_property.dart';
part 'widgets/recipe_ingredients.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.recipeId});

  final String recipeId;

  @override
  Widget build(BuildContext context) {
    final detailBloc = RecipeDetailBlocDependency.of(context);
    return BlocInjector<RecipeDetailBloc>(
      bloc: detailBloc..add(LoadRecipeDetailEvent(recipeId)),
      child: const DetailView(),
    );
  }
}
