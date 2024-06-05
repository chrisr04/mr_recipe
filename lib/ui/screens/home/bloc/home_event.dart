part of 'home_bloc.dart';

sealed class HomeEvent {
  const HomeEvent();
}

final class LoadRecipesEvent extends HomeEvent {
  const LoadRecipesEvent();
}

final class WatchRecipesEvent extends HomeEvent {
  const WatchRecipesEvent();
}

final class UnwatchRecipesEvent extends HomeEvent {
  const UnwatchRecipesEvent();
}
