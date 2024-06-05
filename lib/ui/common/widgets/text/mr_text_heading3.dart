part of 'text.dart';

class MrTextHeading3 extends StatelessWidget {
  /// The default size of this widget is 24
  const MrTextHeading3(
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
    final heading3 = Theme.of(context).textTheme.displaySmall;
    return _Text(
      key: key,
      label: label,
      fontSize: heading3?.fontSize ?? MrTypography.heading3,
      color: color,
      fontStyle: fontStyle,
      fontWeight: weight ?? heading3?.fontWeight,
      textAlign: textAlign,
      textOverflow: textOverflow,
      letterSpacing: letterSpacing,
      maxLines: maxLines,
      decoration: decoration,
      shadows: shadows,
    );
  }
}
