part of 'spacing.dart';

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
