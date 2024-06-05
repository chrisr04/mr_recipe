import 'dart:async';
import 'package:mr_recipe/core/core.dart';
import 'package:mr_recipe/domain/domain.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc {
  HomeBloc(
    this._getRecipesUseCase,
    this._getRecipeWatcherUseCase,
    this._closeRecipeWatcherUseCase,
  ) {
    _output.add(state);
    _output.stream.listen(_stateHandler);
    _input.stream.listen(_eventHandler);
  }

  final GetRecipesUseCase _getRecipesUseCase;
  final GetRecipeWatcherUseCase _getRecipeWatcherUseCase;
  final CloseRecipeWatcherUseCase _closeRecipeWatcherUseCase;

  HomeState state = const HomeInitialState();
  final StreamController<HomeEvent> _input = StreamController();
  final StreamController<HomeState> _output = StreamController.broadcast();
  StreamSubscription<List<Recipe>>? _watcherSubscription;

  Stream<HomeState> get stream => _output.stream;
  StreamSink<HomeEvent> get events => _input.sink;

  void _stateHandler(HomeState newState) {
    state = newState;
  }

  void _eventHandler(HomeEvent event) {
    switch (event) {
      case LoadRecipesEvent():
        _onLoadRecipesEvent(event);
        break;
      case WatchRecipesEvent():
        _onWatchRecipesEvent(event);
        break;
      case UnwatchRecipesEvent():
        _onUnwatchRecipesEvent(event);
        break;
      default:
    }
  }

  void _onLoadRecipesEvent(LoadRecipesEvent event) async {
    _output.add(const HomeLoadingState());
    final failureOrRecipes = await _getRecipesUseCase();
    failureOrRecipes.fold(
      (failure) => _output.add(HomeFailureState(failure.message)),
      (recipes) => _output.add(HomeLoadedState(recipes)),
    );
  }

  void _onWatchRecipesEvent(WatchRecipesEvent event) {
    if (_watcherSubscription != null) return;

    final failureOrWatcher = _getRecipeWatcherUseCase();

    final result = failureOrWatcher.fold((l) => l, (r) => r);

    if (failureOrWatcher.isLeft) {
      final failure = result as Failure;
      _output.add(HomeFailureState(failure.message));
      return;
    }

    final watcher = result as Stream<List<Recipe>>;

    _watcherSubscription = watcher.listen((recipes) {
      _output.add(HomeLoadedState(recipes));
    });
  }

  void _onUnwatchRecipesEvent(UnwatchRecipesEvent event) async {
    await _closeRecipeWatcherUseCase();
  }

  void dispose() {
    _watcherSubscription?.cancel();
    _input.close();
    _output.close();
  }
}
