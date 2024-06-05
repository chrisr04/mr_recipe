part of 'spacing.dart';

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
