import 'package:flutter/material.dart';
import 'package:mr_recipe/ui/common/utils/bloc/bloc.dart';
import 'package:mr_recipe/ui/common/utils/bloc/widgets/bloc_builder.dart';
import 'package:mr_recipe/ui/common/utils/bloc/widgets/bloc_listener.dart';
import 'package:mr_recipe/ui/common/utils/bloc/types/bloc_types.dart';

class BlocConsumer<B extends Bloc, S> extends StatelessWidget {
  const BlocConsumer({
    super.key,
    required this.listener,
    this.listenWhen,
    required this.builder,
    this.buildWhen,
  });

  final BlocListenerHandler<S> listener;
  final BlocBuildCondition<S>? listenWhen;
  final BlocWidgetBuilder<S> builder;
  final BlocBuildCondition<S>? buildWhen;

  @override
  Widget build(BuildContext context) {
    return BlocListener<B, S>(
      listener: listener,
      listenWhen: listenWhen,
      child: BlocBuilder<B, S>(
        buildWhen: buildWhen,
        builder: builder,
      ),
    );
  }
}
