import 'package:flutter/material.dart';
import 'package:mr_recipe/ui/common/common.dart';

class BlocInjector<T> extends StatefulWidget {
  const BlocInjector({
    super.key,
    required this.bloc,
    required this.child,
    this.autoClose = true,
  });

  final Widget child;
  final T bloc;
  final bool autoClose;

  static T of<T>(BuildContext context, {bool listen = false}) =>
      _BlocInherited.of<T>(context, listen: listen);

  @override
  State<BlocInjector> createState() => _BlocInjectorState<T>();
}

class _BlocInjectorState<T> extends State<BlocInjector> {
  @override
  Widget build(BuildContext context) {
    return _BlocInherited<T>(
      bloc: widget.bloc,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    if (widget.autoClose) (widget.bloc as Bloc).close();
    super.dispose();
  }
}

class _BlocInherited<T> extends InheritedWidget {
  const _BlocInherited({
    super.key,
    required this.bloc,
    required super.child,
  });

  final T bloc;

  static T of<T>(BuildContext context, {bool listen = false}) => listen
      ? context.dependOnInheritedWidgetOfExactType<_BlocInherited<T>>()!.bloc
      : context.findAncestorWidgetOfExactType<_BlocInherited<T>>()!.bloc;

  @override
  bool updateShouldNotify(_BlocInherited<T> oldWidget) =>
      oldWidget.bloc != bloc;
}
