import 'package:flutter/material.dart';
import 'package:mr_recipe/ui/common/common.dart';

part 'mr_primary_button.dart';
part 'mr_primary_label_button.dart';

class _Button extends StatelessWidget {
  const _Button({
    super.key,
    required this.onPressed,
    required this.child,
    required this.enabled,
    this.color,
    this.height,
  });

  final VoidCallback onPressed;
  final Color? color;
  final double? height;
  final Widget child;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: color,
      elevation: 0.0,
      highlightElevation: 0.0,
      height: height,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: child,
    );
  }
}
