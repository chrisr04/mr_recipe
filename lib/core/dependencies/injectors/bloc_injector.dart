import 'package:flutter/material.dart';
import 'package:mr_recipe/ui/common/common.dart';

class BlocInjector<T> extends StatefulWidget {
  const BlocInjector({
    super.key,
    required this.bloc,
    required this.child,
    this.closeOnDispose = true,
  });

  final Widget child;
  final T bloc;
  final bool closeOnDispose;

  static T of<T>(BuildContext context, {bool listen = false}) =>
      InjectorInherited.of<T>(context, listen: listen);

  @override
  State<BlocInjector> createState() => _BlocInjectorState<T>();
}

class _BlocInjectorState<T> extends State<BlocInjector> {
  @override
  Widget build(BuildContext context) {
    return InjectorInherited<T>(
      bloc: widget.bloc,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    if (widget.closeOnDispose) (widget.bloc as Bloc).close();
    super.dispose();
  }
}

class InjectorInherited<T> extends InheritedWidget {
  const InjectorInherited({
    super.key,
    required this.bloc,
    required super.child,
  });

  final T bloc;

  static T of<T>(BuildContext context, {bool listen = false}) => listen
      ? context.dependOnInheritedWidgetOfExactType<InjectorInherited<T>>()!.bloc
      : context.findAncestorWidgetOfExactType<InjectorInherited<T>>()!.bloc;

  @override
  bool updateShouldNotify(InjectorInherited<T> oldWidget) =>
      oldWidget.bloc != bloc;
}
