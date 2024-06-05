part of 'text.dart';

class MrTextHeading2 extends StatelessWidget {
  /// The default size of this widget is 28

  const MrTextHeading2(
    this.label, {
    super.key,
    this.textAlign,
    this.weight,
    this.color,
    this.textOverflow,
    this.letterSpacing,
    this.maxLines,
    this.decoration,
    this.shadows,
    this.fontStyle,
  });

  final String label;
  final TextAlign? textAlign;
  final FontWeight? weight;
  final Color? color;
  final TextOverflow? textOverflow;
  final double? letterSpacing;
  final int? maxLines;
  final TextDecoration? decoration;
  final List<Shadow>? shadows;
  final FontStyle? fontStyle;

  @override
  Widget build(BuildContext context) {
    final heading2 = Theme.of(context).textTheme.displayMedium;
    return _Text(
      key: key,
      label: label,
      fontSize: heading2?.fontSize ?? MrTypography.heading2,
      color: color,
      fontStyle: fontStyle,
      fontWeight: weight ?? heading2?.fontWeight,
      textAlign: textAlign,
      textOverflow: textOverflow,
      letterSpacing: letterSpacing,
      maxLines: maxLines,
      decoration: decoration,
      shadows: shadows,
    );
  }
}
