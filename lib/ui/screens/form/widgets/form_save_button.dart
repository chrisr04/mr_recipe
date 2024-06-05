part of '../form_screen.dart';

class FormSaveButton extends StatelessWidget {
  const FormSaveButton({
    super.key,
    required this.formKey,
    required this.recipeId,
  });

  final GlobalKey<FormState> formKey;
  final String recipeId;

  bool get _isEdit => recipeId.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final formBloc = BlocInjector.of<RecipeFormBloc>(context);
    return StreamBuilder(
      stream: formBloc.stream,
      initialData: formBloc.state,
      builder: (context, snapshot) {
        if (snapshot.data == null) return const SizedBox.shrink();
        final state = snapshot.data!;

        return SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: MrSpacing.md,
                ).copyWith(
                  bottom: MrSpacing.lg,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: MrPrimaryButton(
                    label: MrStrings.save,
                    onPressed: () => _onButtonPressed(
                      context,
                      data: state.data,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _onButtonPressed(
    BuildContext context, {
    required RecipeFormStateData data,
  }) {
    final formBloc = BlocInjector.of<RecipeFormBloc>(context);
    final isFormValid = formKey.currentState?.validate() ?? false;
    if (!isFormValid) return;
    final recipe = Recipe(
      id: _isEdit ? recipeId : UniqueKey().toString(),
      name: data.name,
      description: data.description,
      preparationTime: int.parse(data.preparationTime),
      cookingTime: int.parse(data.cookingTime),
      ingredients: data.ingredients.values.toList(),
    );

    if (_isEdit) {
      formBloc.events.add(
        UpdateRecipeEvent(recipe),
      );
    } else {
      formBloc.events.add(
        SaveRecipeEvent(recipe),
      );
    }
  }
}
