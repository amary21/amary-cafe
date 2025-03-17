import 'package:amary_cafe/style/colors/cafe_colors.dart';
import 'package:amary_cafe/style/typography/cafe_text_style.dart';
import 'package:flutter/material.dart';

class CafeTheme {

  static TextTheme get _textTheme {
    return TextTheme(
      displayLarge: CafeTextStyle.displayLarge,
      displayMedium: CafeTextStyle.displayMedium,
      displaySmall: CafeTextStyle.displaySmall,
      headlineLarge: CafeTextStyle.headlineLarge,
      headlineMedium: CafeTextStyle.headlineMedium,
      headlineSmall: CafeTextStyle.headlineSmall,
      titleLarge: CafeTextStyle.titleLarge,
      titleMedium: CafeTextStyle.titleMedium,
      titleSmall: CafeTextStyle.titleSmall,
      bodyLarge: CafeTextStyle.bodyLargeBold,
      bodyMedium: CafeTextStyle.bodyLargeMedium,
      bodySmall: CafeTextStyle.bodyLargeRegular,
      labelLarge: CafeTextStyle.labelLarge,
      labelMedium: CafeTextStyle.labelMedium,
      labelSmall: CafeTextStyle.labelSmall,
    );
  }

  static AppBarTheme get _appBarTheme {
    return AppBarTheme(
        toolbarTextStyle: _textTheme.titleLarge,
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(14),
            bottomRight: Radius.circular(14),
        ),
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      colorSchemeSeed: CafeColors.blue.color,
      brightness: Brightness.light,
      textTheme: _textTheme,
      useMaterial3: true,
      appBarTheme: _appBarTheme,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorSchemeSeed: CafeColors.blue.color,
      brightness: Brightness.dark,
      textTheme: _textTheme,
      useMaterial3: true,
      appBarTheme: _appBarTheme,
    );
  }
}