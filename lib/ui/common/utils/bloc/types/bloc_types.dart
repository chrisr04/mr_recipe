import 'dart:async';
import 'package:flutter/material.dart';

typedef Emitter<S> = void Function(S state);

typedef EventHandler<E, S> = FutureOr<void> Function(E event, Emitter<S> emit);

typedef BlocListenerFunction<S> = void Function(BuildContext context, S state);

typedef BlocBuilderFunction<S> = Widget Function(BuildContext context, S state);

typedef BlocCondition<S> = bool Function(S previous, S current);
