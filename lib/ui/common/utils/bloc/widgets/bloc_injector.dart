import 'package:flutter/material.dart';
import 'package:mr_recipe/ui/common/common.dart';
import 'package:mr_recipe/ui/common/utils/bloc/nested/nested.dart';

class BlocInjector<B extends Bloc> extends SingleChildStatefulWidget {
  const BlocInjector({
    super.key,
    super.child,
    required this.bloc,
    this.closeOnDispose = true,
  });

  final B bloc;
  final bool closeOnDispose;

  static B of<B extends Bloc>(BuildContext context, {bool listen = false}) =>
      _BlocInherited.of<B>(context, listen);

  @override
  SingleChildState<BlocInjector> createState() => _BlocInjectorState<B>();
}

class _BlocInjectorState<B extends Bloc>
    extends SingleChildState<BlocInjector> {
  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return _BlocInherited<B>(
      bloc: widget.bloc as B,
      child: child ?? const SizedBox.shrink(),
    );
  }

  @override
  void dispose() {
    if (widget.closeOnDispose) widget.bloc.close();
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
