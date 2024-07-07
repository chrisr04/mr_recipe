import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mr_recipe/ui/common/utils/bloc/bloc.dart';
import 'package:mr_recipe/ui/common/utils/bloc/types/bloc_types.dart';
import 'package:mr_recipe/ui/common/utils/bloc/widgets/bloc_injector.dart';

class BlocListener<B extends Bloc, S> extends StatefulWidget {
  const BlocListener({
    super.key,
    required this.listener,
    this.listenWhen,
    this.child,
  });

  final BlocListenerHandler<S> listener;
  final BloBuildCondition<S>? listenWhen;
  final Widget? child;

  @override
  State<BlocListener<B, S>> createState() => _BlocListenerState<B, S>();
}

class _BlocListenerState<B extends Bloc, S> extends State<BlocListener<B, S>> {
  late final bloc = BlocInjector.of<B>(context);
  StreamSubscription? _blocSubscription;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      _blocSubscription = bloc.stream.listen(_onListen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child ?? const SizedBox.shrink();
  }

  @override
  void dispose() {
    _blocSubscription?.cancel();
    super.dispose();
  }

  void _onListen(dynamic state) {
    final hasListenWhen = widget.listenWhen != null;
    if (hasListenWhen && !widget.listenWhen!(bloc.previousState, state)) return;
    widget.listener(context, state);
  }
}
