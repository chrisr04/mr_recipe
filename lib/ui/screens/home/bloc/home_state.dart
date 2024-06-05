part of 'home_bloc.dart';

sealed class HomeState {
  const HomeState();
}

final class HomeInitialState extends HomeState {
  const HomeInitialState();
}

final class HomeLoadingState extends HomeState {
  const HomeLoadingState();
}

final class HomeLoadedState extends HomeState {
  const HomeLoadedState(this.recipes);

  final List<Recipe> recipes;
}

final class HomeFailureState extends HomeState {
  const HomeFailureState(this.message);

  final String message;
}
