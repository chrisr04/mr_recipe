part of 'spacing.dart';

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
