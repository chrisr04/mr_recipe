import 'package:flutter/material.dart';

class MrSpacingXXS extends StatelessWidget {
  const MrSpacingXXS({super.key, this.axis});

  final MrSpacingAxis? axis;

  @override
  Widget build(BuildContext context) {
    return _Spacing(
      axis: axis,
      value: MrSpacing.xxs,
    );
  }
}

class MrSpacingXS extends StatelessWidget {
  const MrSpacingXS({super.key, this.axis});

  final MrSpacingAxis? axis;

  @override
  Widget build(BuildContext context) {
    return _Spacing(
      axis: axis,
      value: MrSpacing.xs,
    );
  }
}

class MrSpacingS extends StatelessWidget {
  const MrSpacingS({super.key, this.axis});

  final MrSpacingAxis? axis;

  @override
  Widget build(BuildContext context) {
    return _Spacing(
      axis: axis,
      value: MrSpacing.sm,
    );
  }
}

class MrSpacingM extends StatelessWidget {
  const MrSpacingM({super.key, this.axis});

  final MrSpacingAxis? axis;

  @override
  Widget build(BuildContext context) {
    return _Spacing(
      axis: axis,
      value: MrSpacing.md,
    );
  }
}

class MrSpacingL extends StatelessWidget {
  const MrSpacingL({super.key, this.axis});

  final MrSpacingAxis? axis;

  @override
  Widget build(BuildContext context) {
    return _Spacing(
      axis: axis,
      value: MrSpacing.lg,
    );
  }
}

class MrSpacingXL extends StatelessWidget {
  const MrSpacingXL({super.key, this.axis});

  final MrSpacingAxis? axis;

  @override
  Widget build(BuildContext context) {
    return _Spacing(
      axis: axis,
      value: MrSpacing.xl,
    );
  }
}

class MrSpacingXXL extends StatelessWidget {
  const MrSpacingXXL({super.key, this.axis});

  final MrSpacingAxis? axis;

  @override
  Widget build(BuildContext context) {
    return _Spacing(
      axis: axis,
      value: MrSpacing.xxl,
    );
  }
}

class _Spacing extends StatelessWidget {
  const _Spacing({
    this.axis = MrSpacingAxis.y,
    required this.value,
  });

  final MrSpacingAxis? axis;
  final double value;

  @override
  Widget build(BuildContext context) {
    return switch (axis) {
      MrSpacingAxis.x => SizedBox(width: value),
      _ => SizedBox(height: value),
    };
  }
}

enum MrSpacingAxis { x, y }

class MrSpacing {
  ///zero = 0.0
  static const double zero = 0.0;

  ///xxs = 2.0
  static const double xxs = 2.0;

  ///xs = 4.0
  static const double xs = 4.0;

  ///sm = 8.0
  static const double sm = 8.0;

  ///sL = 12.0
  static const double sl = 12.0;

  ///md = 16.0
  static const double md = 16.0;

  ///lg = 24.0
  static const double lg = 24.0;

  ///xl = 32.0
  static const double xl = 32.0;

  ///xxl = 48.0
  static const double xxl = 48.0;
}
