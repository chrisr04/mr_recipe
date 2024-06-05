part of 'spacing.dart';

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
