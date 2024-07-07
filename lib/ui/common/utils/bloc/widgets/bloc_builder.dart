import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mr_recipe/ui/common/utils/bloc/bloc.dart';
import 'package:mr_recipe/ui/common/utils/bloc/types/bloc_types.dart';
import 'package:mr_recipe/ui/common/utils/bloc/widgets/bloc_injector.dart';

class BlocBuilder<B extends Bloc, S> extends StatefulWidget {
  const BlocBuilder({
    super.key,
    required this.builder,
    this.buildWhen,
  });

  final BlocWidgetBuilder<S> builder;
  final BloBuildCondition<S>? buildWhen;

  @override
  State<BlocBuilder<B, S>> createState() => _BlocBuilderState<B, S>();
}

class _BlocBuilderState<B extends Bloc, S> extends State<BlocBuilder<B, S>> {
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
    return widget.builder(context, bloc.state);
  }

  @override
  void dispose() {
    _blocSubscription?.cancel();
    super.dispose();
  }

  void _onListen(dynamic state) {
    final hasBuildWhen = widget.buildWhen != null;
    if (hasBuildWhen && !widget.buildWhen!(bloc.previousState, state)) return;
    setState(() {});
  }
}
