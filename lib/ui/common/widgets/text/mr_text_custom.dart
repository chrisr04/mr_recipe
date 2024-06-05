part of 'text.dart';

class MrTextCustom extends StatelessWidget {
  /// The default size of this widget is 12

  const MrTextCustom(
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
    this.fontSize,
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
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return _Text(
      key: key,
      label: label,
      fontSize: fontSize ?? 12.0,
      color: color,
      fontStyle: fontStyle,
      fontWeight: weight ?? FontWeight.w400,
      textAlign: textAlign,
      textOverflow: textOverflow,
      letterSpacing: letterSpacing,
      maxLines: maxLines,
      decoration: decoration,
      shadows: shadows,
    );
  }
}
