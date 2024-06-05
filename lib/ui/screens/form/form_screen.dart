import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mr_recipe/core/core.dart';
import 'package:mr_recipe/domain/domain.dart';
import 'package:mr_recipe/ui/common/common.dart';
import 'package:mr_recipe/ui/navigation/routes.dart';
import 'package:mr_recipe/ui/screens/form/bloc/recipe_form_bloc.dart';
import 'package:mr_recipe/ui/theme/theme.dart';

part 'helpers/form_helpers.dart';
part 'widgets/recipe_form.dart';
part 'widgets/ingredient_field.dart';
part 'widgets/save_button.dart';
part 'widgets/success_modal.dart';
part 'widgets/loading_indicator.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key, required this.recipeId});

  final String recipeId;

  @override
  Widget build(BuildContext context) {
    final formBloc = RecipeFormBlocDependency.of(context);
    return BlocInjector<RecipeFormBloc>(
      bloc: formBloc..events.add(InitializeFormEvent(recipeId)),
      child: FormView(
        recipeId: recipeId,
      ),
    );
  }
}

class FormView extends StatefulWidget {
  const FormView({super.key, required this.recipeId});

  final String recipeId;

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  final _formKey = GlobalKey<FormState>();
  late final _formBloc = BlocInjector.of<RecipeFormBloc>(context);
  StreamSubscription<RecipeFormState>? _listenerSubscription;

  @override
  void didChangeDependencies() {
    _listenerSubscription ??= _formBloc.stream.listen(_listenFormBloc);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MrAppBar(
        title: widget.recipeId.isEmpty
            ? MrStrings.createRecipe
            : MrStrings.editRecipe,
      ),
      body: CustomScrollView(
        slivers: [
          RecipeForm(
            formKey: _formKey,
            recipeId: widget.recipeId,
          ),
          FormSaveButton(
            formKey: _formKey,
            recipeId: widget.recipeId,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _listenerSubscription?.cancel();
    _formBloc.dispose();
    super.dispose();
  }

  void _listenFormBloc(RecipeFormState state) {
    if (!context.mounted) return;
    switch (state) {
      case ShowLoadingState():
        MrLoadingModal.show(context);
        break;
      case CloseLoadingState():
        Navigator.of(context).pop();
        break;
      case RecipeSavedState():
        RecipeFormHelpers.showCreateModalSuccess(context);
        break;
      case RecipeUpdatedState():
        RecipeFormHelpers.showUpdateModalSuccess(context, widget.recipeId);
        break;
      case FormFailureState():
        MrSnackBar.showError(context, message: state.message);
        break;
      default:
    }
  }
}
