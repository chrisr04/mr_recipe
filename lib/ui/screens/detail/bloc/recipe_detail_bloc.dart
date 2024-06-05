import 'dart:async';
import 'package:mr_recipe/domain/domain.dart';

part 'recipe_detail_event.dart';
part 'recipe_detail_state.dart';

class RecipeDetailBloc {
  RecipeDetailBloc(
    this._getRecipeByIdUseCase,
    this._deleteRecipeUseCase,
  ) {
    _output.add(state);
    _output.stream.listen(_stateHandler);
    _input.stream.listen(_eventHandler);
  }

  final GetRecipeByIdUseCase _getRecipeByIdUseCase;
  final DeleteRecipeUseCase _deleteRecipeUseCase;

  RecipeDetailState state = const DetailInitialState();
  final _input = StreamController<RecipeDetailEvent>();
  final _output = StreamController<RecipeDetailState>.broadcast();

  Stream<RecipeDetailState> get stream => _output.stream;
  StreamSink<RecipeDetailEvent> get events => _input.sink;

  void _stateHandler(RecipeDetailState newState) {
    state = newState;
  }

  void _eventHandler(RecipeDetailEvent event) {
    switch (event) {
      case LoadRecipeDetailEvent():
        _onLoadRecipeDetailEvent(event);
        break;
      case DeleteRecipeEvent():
        _onDeleteRecipeEvent(event);
        break;
      default:
    }
  }

  void _onLoadRecipeDetailEvent(
    LoadRecipeDetailEvent event,
  ) async {
    _output.add(const DetailLoadingState());
    final failureOrRecipe = await _getRecipeByIdUseCase(event.recipeId);
    failureOrRecipe.fold(
      (failure) => _output.add(DetailFailureState(failure.message)),
      (recipe) => _output.add(DetailLoadedState(recipe)),
    );
  }

  void _onDeleteRecipeEvent(
    DeleteRecipeEvent event,
  ) async {
    _output.add(const ShowLoadingState());
    final failureOrDeleted = await _deleteRecipeUseCase(event.recipeId);
    _output.add(const CloseLoadingState());
    failureOrDeleted.fold(
      () => _output.add(const RecipeDeletedState()),
      (failure) => _output.add(DeleteRecipeFailureState(failure.message)),
    );
  }

  void dispose() {
    _input.close();
    _output.close();
  }
}
