part of 'spacing.dart';

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
