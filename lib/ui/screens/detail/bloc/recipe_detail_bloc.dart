import 'package:mr_recipe/domain/domain.dart';
import 'package:mr_recipe/ui/common/common.dart';

part 'recipe_detail_event.dart';
part 'recipe_detail_state.dart';

class RecipeDetailBloc extends Bloc<RecipeDetailEvent, RecipeDetailState> {
  RecipeDetailBloc(
    this._getRecipeByIdUseCase,
    this._deleteRecipeUseCase,
  ) : super(const DetailInitialState()) {
    register<LoadRecipeDetailEvent>(_onLoadRecipeDetailEvent);
    register<DeleteRecipeEvent>(_onDeleteRecipeEvent);
  }

  final GetRecipeByIdUseCase _getRecipeByIdUseCase;
  final DeleteRecipeUseCase _deleteRecipeUseCase;

  void _onLoadRecipeDetailEvent(
    LoadRecipeDetailEvent event,
    Emitter<RecipeDetailState> emit,
  ) async {
    emit(const DetailLoadingState());
    final failureOrRecipe = await _getRecipeByIdUseCase(event.recipeId);
    failureOrRecipe.fold(
      (failure) => emit(DetailFailureState(failure.message)),
      (recipe) => emit(DetailLoadedState(recipe)),
    );
  }

  void _onDeleteRecipeEvent(
    DeleteRecipeEvent event,
    Emitter<RecipeDetailState> emit,
  ) async {
    emit(const ShowLoadingState());
    final failureOrDeleted = await _deleteRecipeUseCase(event.recipeId);
    emit(const CloseLoadingState());
    failureOrDeleted.fold(
      () => emit(const RecipeDeletedState()),
      (failure) => emit(DeleteRecipeFailureState(failure.message)),
    );
  }
}
