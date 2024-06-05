part of 'text.dart';

class MrTextHeading4 extends StatelessWidget {
  /// The default size of this widget is 20

  const MrTextHeading4(
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
    final heading4 = Theme.of(context).textTheme.headlineMedium;
    return _Text(
      key: key,
      label: label,
      fontSize: heading4?.fontSize ?? MrTypography.heading4,
      color: color,
      fontStyle: fontStyle,
      fontWeight: weight ?? heading4?.fontWeight,
      textAlign: textAlign,
      textOverflow: textOverflow,
      letterSpacing: letterSpacing,
      maxLines: maxLines,
      decoration: decoration,
      shadows: shadows,
    );
  }
}
