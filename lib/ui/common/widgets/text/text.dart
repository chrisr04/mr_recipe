import 'package:flutter/material.dart';
import 'package:mr_recipe/ui/theme/theme.dart';

part 'mr_text_custom.dart';
part 'mr_text_heading1.dart';
part 'mr_text_heading2.dart';
part 'mr_text_heading3.dart';
part 'mr_text_heading4.dart';
part 'mr_text_heading5.dart';
part 'mr_text_heading6.dart';
part 'mr_text_large.dart';
part 'mr_text_medium.dart';
part 'mr_text_small.dart';

class _Text extends StatelessWidget {
  const _Text({
    super.key,
    required this.label,
    required this.fontSize,
    this.color,
    this.fontStyle,
    this.fontWeight,
    this.textOverflow,
    this.textAlign,
    this.letterSpacing,
    this.maxLines,
    this.decoration,
    this.shadows,
  });

  final String label;
  final double fontSize;
  final TextOverflow? textOverflow;
  final Color? color;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final TextAlign? textAlign;
  final double? letterSpacing;
  final int? maxLines;
  final TextDecoration? decoration;
  final List<Shadow>? shadows;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(
        color: color ?? MrColors.black,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle ?? FontStyle.normal,
        letterSpacing: letterSpacing,
        decoration: decoration ?? TextDecoration.none,
        overflow: textOverflow,
        shadows: shadows,
      ),
    );
  }
}
