part of '../form_screen.dart';

class FormView extends StatefulWidget {
  const FormView({super.key, required this.recipeId});

  final String recipeId;

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RecipeFormBloc, RecipeFormState>(
      listener: _listenFormBloc,
      child: Scaffold(
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
      ),
    );
  }

  void _listenFormBloc(BuildContext context, RecipeFormState state) {
    switch (state) {
      case ShowLoadingState():
        MrLoadingModal.show(context);
        break;
      case CloseLoadingState():
        Navigator.of(context).pop();
        break;
      case RecipeSavedState():
        FormHelpers.showCreateModalSuccess(context);
        break;
      case RecipeUpdatedState():
        FormHelpers.showUpdateModalSuccess(context, widget.recipeId);
        break;
      case FormFailureState():
        MrSnackBar.showError(context, message: state.message);
        break;
      default:
    }
  }
}
