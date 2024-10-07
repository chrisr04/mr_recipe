import 'dart:async';
import 'package:mr_recipe/core/core.dart';
import 'package:mr_recipe/domain/domain.dart';
import 'package:reactor/reactor.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(
    this._getRecipesUseCase,
    this._getRecipeWatcherUseCase,
    this._closeRecipeWatcherUseCase,
  ) : super(const HomeInitialState()) {
    register<LoadRecipesEvent>(_onLoadRecipesEvent);
    register<WatchRecipesEvent>(_onWatchRecipesEvent);
    register<UnwatchRecipesEvent>(_onUnwatchRecipesEvent);
  }

  final GetRecipesUseCase _getRecipesUseCase;
  final GetRecipeWatcherUseCase _getRecipeWatcherUseCase;
  final CloseRecipeWatcherUseCase _closeRecipeWatcherUseCase;
  StreamSubscription<List<Recipe>>? _watcherSubscription;

  void _onLoadRecipesEvent(
    LoadRecipesEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeLoadingState());
    final failureOrRecipes = await _getRecipesUseCase();
    failureOrRecipes.fold(
      (failure) => emit(HomeFailureState(failure.message)),
      (recipes) => emit(HomeLoadedState(recipes)),
    );
  }

  void _onWatchRecipesEvent(
    WatchRecipesEvent event,
    Emitter<HomeState> emit,
  ) {
    if (_watcherSubscription != null) return;

    final failureOrWatcher = _getRecipeWatcherUseCase();

    final result = failureOrWatcher.fold((l) => l, (r) => r);

    if (failureOrWatcher.isLeft) {
      final failure = result as Failure;
      emit(HomeFailureState(failure.message));
      return;
    }

    final watcher = result as Stream<List<Recipe>>;

    _watcherSubscription = watcher.listen((recipes) {
      emit(HomeLoadedState(recipes));
    });
  }

  void _onUnwatchRecipesEvent(
    UnwatchRecipesEvent event,
    Emitter<HomeState> emit,
  ) async {
    await _closeRecipeWatcherUseCase();
  }

  @override
  Future<void> close() async {
    _watcherSubscription?.cancel();
    return super.close();
  }
}
