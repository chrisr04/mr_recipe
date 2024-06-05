import 'dart:async';
import 'package:mr_recipe/domain/domain.dart';

part 'recipe_form_event.dart';
part 'recipe_form_state.dart';

class RecipeFormBloc {
  RecipeFormBloc(
    this._getRecipeByIdUseCase,
    this._createRecipeUseCase,
    this._updateRecipeUseCase,
  ) {
    _output.add(state);
    _output.stream.listen(_stateHandler);
    _input.stream.listen(_eventHandler);
  }

  final GetRecipeByIdUseCase _getRecipeByIdUseCase;
  final CreateRecipeUseCase _createRecipeUseCase;
  final UpdateRecipeUseCase _updateRecipeUseCase;

  RecipeFormState state = const FormInitialState(RecipeFormStateData());
  final _input = StreamController<RecipeFormEvent>();
  final _output = StreamController<RecipeFormState>.broadcast();

  Stream<RecipeFormState> get stream => _output.stream;
  StreamSink<RecipeFormEvent> get events => _input.sink;

  void _stateHandler(RecipeFormState newState) {
    state = newState;
  }

  void _eventHandler(RecipeFormEvent event) {
    switch (event) {
      case InitializeFormEvent():
        _onInitializeFormEvent(event);
        break;
      case ChangeRecipeDataEvent():
        _onChangeRecipeDataEvent(event);
        break;
      case ChangeIngredientEvent():
        _onChangeIngredientEvent(event);
        break;
      case AddIngredientEvent():
        _onAddIngredientEvent(event);
        break;
      case DeleteIngredientEvent():
        _onDeleteIngredientEvent(event);
        break;
      case SaveRecipeEvent():
        _onSaveRecipeEvent(event);
        break;
      case UpdateRecipeEvent():
        _onUpdateRecipeEvent(event);
      default:
    }
  }

  void _onInitializeFormEvent(
    InitializeFormEvent event,
  ) async {
    if (event.recipeId.isEmpty) return;

    final failureOrRecipe = await _getRecipeByIdUseCase(event.recipeId);

    failureOrRecipe.fold(
      (failure) => _output.add(
        FormFailureState(
          state.data,
          message: failure.message,
        ),
      ),
      (recipe) => _output.add(
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
  ) {
    switch (event.field) {
      case RecipeFormField.name:
        _output.add(
          FormDataChangedState(
            state.data.copyWith(
              name: event.value,
            ),
          ),
        );
        break;
      case RecipeFormField.description:
        _output.add(
          FormDataChangedState(
            state.data.copyWith(
              description: event.value,
            ),
          ),
        );
        break;
      case RecipeFormField.preparationTime:
        _output.add(
          FormDataChangedState(
            state.data.copyWith(
              preparationTime: event.value,
            ),
          ),
        );
        break;
      case RecipeFormField.cookingTime:
        _output.add(
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
  ) {
    final ingredients = Map<int, String>.from(state.data.ingredients);
    ingredients[event.ingredientId] = event.value;
    _output.add(
      FormDataChangedState(
        state.data.copyWith(
          ingredients: ingredients,
        ),
      ),
    );
  }

  void _onAddIngredientEvent(
    AddIngredientEvent event,
  ) {
    final ingredients = Map<int, String>.from(state.data.ingredients);
    ingredients.addAll({event.ingredientId: ''});
    _output.add(
      FormDataChangedState(
        state.data.copyWith(
          ingredients: ingredients,
        ),
      ),
    );
  }

  void _onDeleteIngredientEvent(
    DeleteIngredientEvent event,
  ) {
    final ingredients = Map<int, String>.from(state.data.ingredients);
    ingredients.remove(event.ingredientId);
    _output.add(
      FormDataChangedState(
        state.data.copyWith(
          ingredients: ingredients,
        ),
      ),
    );
  }

  void _onSaveRecipeEvent(
    SaveRecipeEvent event,
  ) async {
    _output.add(ShowLoadingState(state.data));
    final failureOrSaved = await _createRecipeUseCase(event.recipe);
    _output.add(CloseLoadingState(state.data));
    failureOrSaved.fold(
      () => _output.add(RecipeSavedState(state.data)),
      (failure) => _output.add(
        FormFailureState(
          state.data,
          message: failure.message,
        ),
      ),
    );
  }

  void _onUpdateRecipeEvent(
    UpdateRecipeEvent event,
  ) async {
    _output.add(ShowLoadingState(state.data));
    final failureOrUpdated = await _updateRecipeUseCase(event.recipe);
    _output.add(CloseLoadingState(state.data));
    failureOrUpdated.fold(
      () => _output.add(RecipeUpdatedState(state.data)),
      (failure) => _output.add(
        FormFailureState(
          state.data,
          message: failure.message,
        ),
      ),
    );
  }

  void dispose() {
    _input.close();
    _output.close();
  }
}
