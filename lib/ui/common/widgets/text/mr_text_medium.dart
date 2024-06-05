part of 'text.dart';

class MrTextMedium extends StatelessWidget {
  /// The default size of this widget is 12

  const MrTextMedium(
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
    final medium = Theme.of(context).textTheme.bodyMedium;
    return _Text(
      key: key,
      label: label,
      fontSize: medium?.fontSize ?? MrTypography.medium,
      color: color,
      fontStyle: fontStyle,
      fontWeight: weight ?? medium?.fontWeight,
      textAlign: textAlign,
      textOverflow: textOverflow,
      letterSpacing: letterSpacing,
      maxLines: maxLines,
      decoration: decoration,
      shadows: shadows,
    );
  }
}
