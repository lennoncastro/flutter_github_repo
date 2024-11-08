import 'package:flutter/material.dart';
import 'package:github_repos/core/theme/colors.dart';

final ThemeData appTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: ThemeColors.primaryColor,
  colorScheme: const ColorScheme.dark(
    primary: ThemeColors.primaryColor,
    secondary: ThemeColors.secondaryColor,
    surface: ThemeColors.surfaceColor,
    onPrimary: ThemeColors.onPrimaryColor,
    onSecondary: ThemeColors.onSecondaryColor,
  ),
  scaffoldBackgroundColor: ThemeColors.backgroundColor,
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: ThemeColors.surfaceColor,
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: ThemeColors.borderColor,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: ThemeColors.borderColor,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: ThemeColors.primaryColor,
      ),
    ),
    hintStyle: TextStyle(
      color: ThemeColors.hintTextColor,
    ),
    contentPadding: EdgeInsets.all(12),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontFamily: 'Courier',
      fontSize: 14.0,
      color: ThemeColors.secondaryColor,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Courier',
      fontSize: 14.0,
      color: ThemeColors.secondaryColor,
    ),
    headlineLarge: TextStyle(
      fontFamily: 'Courier',
      fontSize: 24.0,
      color: ThemeColors.onPrimaryColor,
    ),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: ThemeColors.primaryColor,
    textTheme: ButtonTextTheme.primary,
  ),
);

extension TextThemeX on TextTheme {
  TextStyle get bodySmallBold {
    return this.bodyMedium!.copyWith(fontSize: 12, fontWeight: FontWeight.bold);
  }

  TextStyle get bodyMediumBold {
    return this.bodyMedium!.copyWith(fontWeight: FontWeight.bold);
  }
}
