part of 'spacing.dart';

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
