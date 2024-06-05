import 'package:flutter/material.dart';

class BlocInjector<T> extends InheritedWidget {
  const BlocInjector({
    super.key,
    required this.bloc,
    required super.child,
  });

  final T bloc;

  static T of<T>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BlocInjector<T>>()!.bloc;
  }

  @override
  bool updateShouldNotify(BlocInjector<T> oldWidget) => false;
}
