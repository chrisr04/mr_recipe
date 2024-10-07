import 'package:mr_recipe/domain/domain.dart';
import 'package:reactor/reactor.dart';

part 'recipe_form_event.dart';
part 'recipe_form_state.dart';

class RecipeFormBloc extends Bloc<RecipeFormEvent, RecipeFormState> {
  RecipeFormBloc(
    this._getRecipeByIdUseCase,
    this._createRecipeUseCase,
    this._updateRecipeUseCase,
  ) : super(const FormInitialState(RecipeFormStateData())) {
    register<InitializeFormEvent>(_onInitializeFormEvent);
    register<ChangeRecipeDataEvent>(_onChangeRecipeDataEvent);
    register<ChangeIngredientEvent>(_onChangeIngredientEvent);
    register<AddIngredientEvent>(_onAddIngredientEvent);
    register<DeleteIngredientEvent>(_onDeleteIngredientEvent);
    register<SaveRecipeEvent>(_onSaveRecipeEvent);
    register<UpdateRecipeEvent>(_onUpdateRecipeEvent);
  }

  final GetRecipeByIdUseCase _getRecipeByIdUseCase;
  final CreateRecipeUseCase _createRecipeUseCase;
  final UpdateRecipeUseCase _updateRecipeUseCase;

  void _onInitializeFormEvent(
    InitializeFormEvent event,
    Emitter<RecipeFormState> emit,
  ) async {
    if (event.recipeId.isEmpty) return;

    final failureOrRecipe = await _getRecipeByIdUseCase(event.recipeId);

    failureOrRecipe.fold(
      (failure) => emit(
        FormFailureState(
          state.data,
          message: failure.message,
        ),
      ),
      (recipe) => emit(
        FormDataChangedState(
          state.data.copyWith(
            name: recipe.name,
            description: recipe.description,
            preparationTime: recipe.preparationTime.toString(),
            cookingTime: recipe.cookingTime.toString(),
            ingredients: recipe.ingredients.asMap(),
          ),
        ),
      ),
    );
  }

  void _onChangeRecipeDataEvent(
    ChangeRecipeDataEvent event,
    Emitter<RecipeFormState> emit,
  ) {
    switch (event.field) {
      case RecipeFormField.name:
        emit(
          FormDataChangedState(
            state.data.copyWith(
              name: event.value,
            ),
          ),
        );
        break;
      case RecipeFormField.description:
        emit(
          FormDataChangedState(
            state.data.copyWith(
              description: event.value,
            ),
          ),
        );
        break;
      case RecipeFormField.preparationTime:
        emit(
          FormDataChangedState(
            state.data.copyWith(
              preparationTime: event.value,
            ),
          ),
        );
        break;
      case RecipeFormField.cookingTime:
        emit(
          FormDataChangedState(
            state.data.copyWith(
              cookingTime: event.value,
            ),
          ),
        );
        break;
    }
  }

  void _onChangeIngredientEvent(
    ChangeIngredientEvent event,
    Emitter<RecipeFormState> emit,
  ) {
    final ingredients = Map<int, String>.from(state.data.ingredients);
    ingredients[event.ingredientId] = event.value;
    emit(
      FormDataChangedState(
        state.data.copyWith(
          ingredients: ingredients,
        ),
      ),
    );
  }

  void _onAddIngredientEvent(
    AddIngredientEvent event,
    Emitter<RecipeFormState> emit,
  ) {
    final ingredients = Map<int, String>.from(state.data.ingredients);
    ingredients.addAll({event.ingredientId: ''});
    emit(
      FormDataChangedState(
        state.data.copyWith(
          ingredients: ingredients,
        ),
      ),
    );
  }

  void _onDeleteIngredientEvent(
    DeleteIngredientEvent event,
    Emitter<RecipeFormState> emit,
  ) {
    final ingredients = Map<int, String>.from(state.data.ingredients);
    ingredients.remove(event.ingredientId);
    emit(
      FormDataChangedState(
        state.data.copyWith(
          ingredients: ingredients,
        ),
      ),
    );
  }

  void _onSaveRecipeEvent(
    SaveRecipeEvent event,
    Emitter<RecipeFormState> emit,
  ) async {
    emit(ShowLoadingState(state.data));
    final failureOrSaved = await _createRecipeUseCase(event.recipe);
    emit(CloseLoadingState(state.data));
    failureOrSaved.fold(
      () => emit(RecipeSavedState(state.data)),
      (failure) => emit(
        FormFailureState(
          state.data,
          message: failure.message,
        ),
      ),
    );
  }

  void _onUpdateRecipeEvent(
    UpdateRecipeEvent event,
    Emitter<RecipeFormState> emit,
  ) async {
    emit(ShowLoadingState(state.data));
    final failureOrUpdated = await _updateRecipeUseCase(event.recipe);
    emit(CloseLoadingState(state.data));
    failureOrUpdated.fold(
      () => emit(RecipeUpdatedState(state.data)),
      (failure) => emit(
        FormFailureState(
          state.data,
          message: failure.message,
        ),
      ),
    );
  }
}
