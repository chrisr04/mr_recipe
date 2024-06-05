part of '../form_screen.dart';

class IngredientField extends StatelessWidget {
  const IngredientField({
    super.key,
    this.isLast = false,
    required this.ingredientId,
    this.initialValue,
  });

  final bool isLast;
  final int ingredientId;

  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: MrSpacing.md,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: MrTextFormField(
              initialValue: initialValue,
              hintText: MrStrings.newIngredient,
              validator: FormValidator.isRequired,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: (value) => _onChangedIngredient(
                context,
                value: value,
              ),
            ),
          ),
          const MrSpacingXS(axis: MrSpacingAxis.x),
          Padding(
            padding: const EdgeInsets.only(top: MrSpacing.xxs),
            child: IconButton(
              onPressed: () => _onButtonPessed(context),
              icon: Icon(
                isLast ? Icons.add_circle_outline : Icons.remove_circle_outline,
                size: 32.0,
                color: isLast
                    ? Theme.of(context).colorScheme.success
                    : Theme.of(context).colorScheme.error,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onChangedIngredient(BuildContext context, {required String value}) {
    final formBloc = BlocInjector.of<RecipeFormBloc>(context);
    formBloc.events.add(
      ChangeIngredientEvent(
        ingredientId: ingredientId,
        value: value,
      ),
    );
  }

  void _onButtonPessed(BuildContext context) {
    final formBloc = BlocInjector.of<RecipeFormBloc>(context);
    if (isLast) {
      formBloc.events.add(
        AddIngredientEvent(ingredientId + 1),
      );
    } else {
      formBloc.events.add(
        DeleteIngredientEvent(ingredientId),
      );
    }
  }
}
