part of '../form_screen.dart';

class RecipeForm extends StatelessWidget {
  const RecipeForm({
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
      builder: (context, snapshot) {
        if (snapshot.data == null) return const SliverToBoxAdapter();
        final state = snapshot.data!;
        final ingredientIds = state.data.ingredients.keys;

        if (state is FormInitialState && _isEdit) {
          return const FormLoadingIndicator();
        }

        return SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: MrSpacing.md,
              vertical: MrSpacing.lg,
            ),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MrTextFormField(
                    label: MrStrings.name,
                    initialValue: state.data.name,
                    hintText: MrStrings.writeRecipeName,
                    validator: FormValidator.isRequired,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (value) => _onChangedField(
                      context,
                      field: RecipeFormField.name,
                      value: value,
                    ),
                  ),
                  const MrSpacingM(),
                  MrTextFormField(
                    label: MrStrings.descriptionOptional,
                    initialValue: state.data.description,
                    keyboardType: TextInputType.multiline,
                    hintText: MrStrings.describeTheRecipe,
                    minLines: 5,
                    maxLines: 5,
                    onChanged: (value) => _onChangedField(
                      context,
                      field: RecipeFormField.description,
                      value: value,
                    ),
                  ),
                  const MrSpacingM(),
                  MrTextFormField(
                    label: MrStrings.preparationTime,
                    initialValue: state.data.preparationTime,
                    keyboardType: TextInputType.number,
                    hintText: MrStrings.writePreparationTimeInMinutes,
                    validator: FormValidator.isRequiredInteger,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    textInputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (value) => _onChangedField(
                      context,
                      field: RecipeFormField.preparationTime,
                      value: value,
                    ),
                  ),
                  const MrSpacingM(),
                  MrTextFormField(
                    label: MrStrings.cookingTime,
                    initialValue: state.data.cookingTime,
                    keyboardType: TextInputType.number,
                    hintText: MrStrings.writeCookingTimeInMinutes,
                    validator: FormValidator.isRequiredInteger,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    textInputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (value) => _onChangedField(
                      context,
                      field: RecipeFormField.cookingTime,
                      value: value,
                    ),
                  ),
                  const MrSpacingM(),
                  const MrTextMedium(
                    MrStrings.ingredients,
                    weight: FontWeight.w600,
                  ),
                  const MrSpacingS(),
                  for (final ingredientId in ingredientIds)
                    IngredientField(
                      key: ValueKey(ingredientId),
                      initialValue: state.data.ingredients[ingredientId],
                      ingredientId: ingredientId,
                      isLast: ingredientId == ingredientIds.last,
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _onChangedField(
    BuildContext context, {
    required RecipeFormField field,
    required String value,
  }) {
    final formBloc = BlocInjector.of<RecipeFormBloc>(context);
    formBloc.events.add(
      ChangeRecipeDataEvent(
        field: field,
        value: value,
      ),
    );
  }
}
