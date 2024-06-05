import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mr_recipe/core/core.dart';

part 'data_manager_dependency.dart';

class CoreDependencies extends StatelessWidget {
  const CoreDependencies({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DataManagerDependency(
      dataManager: DataManager(),
      child: child,
    );
  }
}
