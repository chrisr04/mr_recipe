import 'package:flutter/material.dart';

part 'mr_spacing.dart';
part 'mr_spacing_xxs.dart';
part 'mr_spacing_xs.dart';
part 'mr_spacing_s.dart';
part 'mr_spacing_m.dart';
part 'mr_spacing_l.dart';
part 'mr_spacing_xl.dart';
part 'mr_spacing_xxl.dart';

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
