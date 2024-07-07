import 'dart:async';
import 'package:flutter/material.dart';

typedef Emitter<S> = void Function(S state);

typedef EventHandler<E, S> = FutureOr<void> Function(E event, Emitter<S> emit);

typedef BlocListenerHandler<S> = void Function(BuildContext context, S state);

typedef BlocWidgetBuilder<S> = Widget Function(BuildContext context, S state);

typedef BloBuildCondition<S> = bool Function(S previous, S current);
