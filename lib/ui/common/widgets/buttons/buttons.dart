import 'package:flutter/material.dart';
import 'package:mr_recipe/ui/common/common.dart';

class MrPrimaryLabelButton extends StatelessWidget {
  const MrPrimaryLabelButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.enabled = true,
  });

  final VoidCallback onPressed;
  final String label;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return _Button(
      key: key,
      onPressed: onPressed,
      enabled: enabled,
      color: Colors.transparent,
      height: 45.0,
      child: MrTextLarge(
        label,
        color: Theme.of(context).colorScheme.primary,
        weight: FontWeight.w600,
        maxLines: 1,
        textOverflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class MrPrimaryButton extends StatelessWidget {
  const MrPrimaryButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.enabled = true,
  });

  final VoidCallback onPressed;
  final String label;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return _Button(
      key: key,
      onPressed: onPressed,
      enabled: enabled,
      color: Theme.of(context).primaryColor,
      height: 45.0,
      child: MrTextLarge(
        label,
        color: Theme.of(context).colorScheme.onPrimary,
        weight: FontWeight.w600,
        maxLines: 1,
        textOverflow: TextOverflow.ellipsis,
      ),
    );
  }
}

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
