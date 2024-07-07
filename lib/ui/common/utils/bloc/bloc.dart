import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mr_recipe/ui/common/utils/bloc/types/bloc_types.dart';

abstract class Bloc<E, S> {
  Bloc(S initialState) {
    _currentState = initialState;
    _states.add(_currentState);
    _events.stream.listen(onMapEventToState);
    _states.stream.listen(onChangeState);
  }

  final _events = StreamController<E>();
  final _states = StreamController<S>.broadcast();
  final _eventHandlers = <Type, Function>{};
  late S _currentState;
  late S _previousState;
  bool _isClosed = false;

  Stream<S> get stream => _states.stream;
  S get state => _currentState;
  S get previousState => _previousState;
  bool get isClosed => _isClosed;

  @protected
  @mustCallSuper
  void onMapEventToState(E event) async {
    final eventHandler = _eventHandlers[event.runtimeType];
    if (eventHandler != null) await eventHandler(event, _states.add);
  }

  @protected
  @mustCallSuper
  void onChangeState(S newState) {
    _previousState = _currentState;
    _currentState = newState;
  }

  @protected
  @mustCallSuper
  void register<T extends E>(EventHandler<T, S> eventHandler) {
    _eventHandlers[T] = eventHandler;
  }

  void add(E event) {
    if (_isClosed) {
      throw StateError(
        'Can\'t add ${event.runtimeType} because the Bloc is closed',
      );
    }

    final eventHandler = _eventHandlers[event.runtimeType];

    if (eventHandler == null) {
      throw StateError(
        'The event ${event.runtimeType} must be registered with: '
        'register<${event.runtimeType}>((event, emit){...})',
      );
    }

    _events.sink.add(event);
  }

  @mustCallSuper
  void close() {
    if (_isClosed) return;
    _events.close();
    _states.close();
    _eventHandlers.clear();
    _isClosed = true;
  }
}
