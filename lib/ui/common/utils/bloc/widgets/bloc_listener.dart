import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mr_recipe/ui/common/utils/bloc/bloc.dart';
import 'package:mr_recipe/ui/common/utils/bloc/types/bloc_types.dart';
import 'package:mr_recipe/ui/common/utils/bloc/widgets/bloc_injector.dart';
import 'package:mr_recipe/ui/common/utils/bloc/nested/nested.dart';

class BlocListener<B extends Bloc, S> extends SingleChildStatefulWidget {
  const BlocListener({
    super.key,
    super.child,
    required this.listener,
    this.listenWhen,
  });

  final BlocListenerHandler<S> listener;
  final BlocBuildCondition<S>? listenWhen;

  @override
  SingleChildState<BlocListener<B, S>> createState() =>
      _BlocListenerState<B, S>();
}

class _BlocListenerState<B extends Bloc, S>
    extends SingleChildState<BlocListener<B, S>> {
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
  Widget buildWithChild(BuildContext context, Widget? child) {
    return child ?? const SizedBox.shrink();
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
