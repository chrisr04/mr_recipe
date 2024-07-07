import 'package:flutter/material.dart';
import 'package:mr_recipe/ui/common/common.dart';

class BlocInjector<B extends Bloc> extends StatefulWidget {
  const BlocInjector({
    super.key,
    required this.bloc,
    required this.child,
    this.autoClose = true,
  });

  final Widget child;
  final B bloc;
  final bool autoClose;

  static B of<B extends Bloc>(BuildContext context, {bool listen = false}) =>
      _BlocInherited.of<B>(context, listen);

  @override
  State<BlocInjector> createState() => _BlocInjectorState<B>();
}

class _BlocInjectorState<B extends Bloc> extends State<BlocInjector> {
  @override
  Widget build(BuildContext context) {
    return _BlocInherited<B>(
      bloc: widget.bloc as B,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    if (widget.autoClose) widget.bloc.close();
    super.dispose();
  }
}

class _BlocInherited<B extends Bloc> extends InheritedWidget {
  const _BlocInherited({
    super.key,
    required this.bloc,
    required super.child,
  });

  final B bloc;

  static B of<B extends Bloc>(BuildContext context, bool listen) => listen
      ? context.dependOnInheritedWidgetOfExactType<_BlocInherited<B>>()!.bloc
      : context.findAncestorWidgetOfExactType<_BlocInherited<B>>()!.bloc;

  @override
  bool updateShouldNotify(_BlocInherited<B> oldWidget) =>
      oldWidget.bloc != bloc;
}
