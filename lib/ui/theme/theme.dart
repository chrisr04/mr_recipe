import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'colors.dart';
part 'typography.dart';

final theme = ThemeData(
  primaryColor: MrColors.deepOrange,
  fontFamily: MrTypography.poppins,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: MrColors.deepOrange,
    onPrimary: MrColors.white,
    secondary: MrColors.oceanBlue,
    onSecondary: MrColors.white,
    error: MrColors.imperialRed,
    onError: MrColors.white,
    background: MrColors.white,
    onBackground: MrColors.black,
    surface: MrColors.white,
    onSurface: MrColors.black,
    tertiary: MrColors.camel,
    shadow: MrColors.black.withOpacity(0.2),
    outline: MrColors.silver,
    outlineVariant: MrColors.chineseSilver,
  ),
  cardTheme: const CardTheme(
    surfaceTintColor: MrColors.white,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: MrTypography.heading1,
      color: MrColors.black,
    ),
    displayMedium: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: MrTypography.heading2,
      color: MrColors.black,
    ),
    displaySmall: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: MrTypography.heading3,
      color: MrColors.black,
    ),
    headlineMedium: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: MrTypography.heading4,
      color: MrColors.black,
    ),
    headlineSmall: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: MrTypography.heading5,
      color: MrColors.black,
    ),
    titleLarge: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: MrTypography.heading6,
      color: MrColors.black,
    ),
    bodyLarge: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: MrTypography.large,
      color: MrColors.black,
    ),
    bodyMedium: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: MrTypography.medium,
      color: MrColors.black,
    ),
    bodySmall: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: MrTypography.small,
      color: MrColors.black,
    ),
  ),
  appBarTheme: AppBarTheme(
    scrolledUnderElevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: MrColors.black.withOpacity(0.1),
      statusBarIconBrightness: Brightness.light,
    ),
  ),
);

extension ColorSchemeExtension on ColorScheme {
  Color get warning => MrColors.warning;
  Color get success => MrColors.success;
}
