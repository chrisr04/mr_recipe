part of 'text.dart';

class MrTextSmall extends StatelessWidget {
  /// The default size of this widget is 10

  const MrTextSmall(
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
    final small = Theme.of(context).textTheme.bodyMedium;
    return _Text(
      key: key,
      label: label,
      fontSize: small?.fontSize ?? MrTypography.small,
      color: color,
      fontStyle: fontStyle,
      fontWeight: weight ?? small?.fontWeight,
      textAlign: textAlign,
      textOverflow: textOverflow,
      letterSpacing: letterSpacing,
      maxLines: maxLines,
      decoration: decoration,
      shadows: shadows,
    );
  }
}
