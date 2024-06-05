import 'package:flutter/material.dart';
import 'package:mr_recipe/ui/theme/theme.dart';

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

class MrTextHeading1 extends StatelessWidget {
  /// The default size of this widget is 32

  const MrTextHeading1(
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
    final heading1 = Theme.of(context).textTheme.displayLarge;
    return _Text(
      key: key,
      label: label,
      fontSize: heading1?.fontSize ?? MrTypography.heading1,
      color: color,
      fontStyle: fontStyle,
      fontWeight: weight ?? heading1?.fontWeight,
      textAlign: textAlign,
      textOverflow: textOverflow,
      letterSpacing: letterSpacing,
      maxLines: maxLines,
      decoration: decoration,
      shadows: shadows,
    );
  }
}

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

class MrTextHeading5 extends StatelessWidget {
  /// The default size of this widget is 18

  const MrTextHeading5(
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
    final heading5 = Theme.of(context).textTheme.headlineSmall;
    return _Text(
      key: key,
      label: label,
      fontSize: heading5?.fontSize ?? MrTypography.heading5,
      color: color,
      fontStyle: fontStyle,
      fontWeight: weight ?? heading5?.fontWeight,
      textAlign: textAlign,
      textOverflow: textOverflow,
      letterSpacing: letterSpacing,
      maxLines: maxLines,
      decoration: decoration,
      shadows: shadows,
    );
  }
}

class MrTextHeading6 extends StatelessWidget {
  /// The default size of this widget is 16

  const MrTextHeading6(
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
    final heading6 = Theme.of(context).textTheme.titleLarge;
    return _Text(
      key: key,
      label: label,
      fontSize: heading6?.fontSize ?? MrTypography.heading6,
      color: color,
      fontStyle: fontStyle,
      fontWeight: weight ?? heading6?.fontWeight,
      textAlign: textAlign,
      textOverflow: textOverflow,
      letterSpacing: letterSpacing,
      maxLines: maxLines,
      decoration: decoration,
      shadows: shadows,
    );
  }
}

class MrTextLarge extends StatelessWidget {
  /// The default size of this widget is 14

  const MrTextLarge(
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
    final large = Theme.of(context).textTheme.bodyLarge;
    return _Text(
      key: key,
      label: label,
      fontSize: large?.fontSize ?? MrTypography.large,
      color: color,
      fontStyle: fontStyle,
      fontWeight: weight ?? large?.fontWeight,
      textAlign: textAlign,
      textOverflow: textOverflow,
      letterSpacing: letterSpacing,
      maxLines: maxLines,
      decoration: decoration,
      shadows: shadows,
    );
  }
}

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
