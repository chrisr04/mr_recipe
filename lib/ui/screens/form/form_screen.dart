import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mr_recipe/core/core.dart';
import 'package:mr_recipe/domain/domain.dart';
import 'package:mr_recipe/ui/common/common.dart';
import 'package:mr_recipe/ui/navigation/app_routes.dart';
import 'package:mr_recipe/ui/screens/form/bloc/recipe_form_bloc.dart';
import 'package:mr_recipe/ui/theme/theme.dart';

part 'helpers/form_helpers.dart';
part 'widgets/form_view.dart';
part 'widgets/recipe_form.dart';
part 'widgets/form_ingredient_field.dart';
part 'widgets/form_save_button.dart';
part 'widgets/form_success_modal.dart';
part 'widgets/form_loading_indicator.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key, required this.recipeId});

  final String recipeId;

  @override
  Widget build(BuildContext context) {
    final formBloc = RecipeFormBlocDependency.of(context);
    return BlocInjector<RecipeFormBloc>(
      bloc: formBloc..add(InitializeFormEvent(recipeId)),
      child: FormView(
        recipeId: recipeId,
      ),
    );
  }
}
