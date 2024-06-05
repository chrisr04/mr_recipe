part of 'spacing.dart';

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
