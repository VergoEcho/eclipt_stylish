import 'package:eclipt_stylish/core/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StylishTheme {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: _lightColorScheme,
    textTheme: _textTheme,
    elevatedButtonTheme: _elevatedButtonTheme,
    inputDecorationTheme: _inputDecorationTheme,
  );

  static final _lightColorScheme =
      ColorScheme.fromSeed(seedColor: Palette.primary).copyWith(
        surface: Palette.surface,
        onSurface: Palette.onSurface,
        onSurfaceVariant: Palette.onSurfaceVariant,
        primary: Palette.primary,
        onPrimary: Palette.onPrimary,
        primaryContainer: Palette.primaryContainer,
        outline: Palette.outline,
        outlineVariant: Palette.outlineVariant,
      );

  static final _textTheme = GoogleFonts.montserratTextTheme(
    TextTheme(
      displayMedium: TextStyle(
        fontSize: 36,
        height: 1.2, // line height 41
        fontWeight: FontWeight.w800,
      ),
      titleMedium: TextStyle(
        fontSize: 24,
        height: 1.2, // line height 29
        fontWeight: FontWeight.w800,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        height: 1.7, // line height 24
        fontWeight: FontWeight.w600,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.2, // line height 17
      ),
      labelLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 1.2, // line height 24
      ),
      labelMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        height: 1.2, // line height 22
      )
    ),
  );

  static final _elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Palette.primary,
      foregroundColor: Palette.onPrimary,
      textStyle: GoogleFonts.montserrat(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 1.2,
      ),
      padding: const EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      elevation: 0,
      minimumSize: const Size(double.infinity, 55),
    ),
  );

  static final _inputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: Palette.primaryContainer,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    hintStyle: GoogleFonts.montserrat(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Palette.onPrimaryContainer,
      height: 1.2
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Palette.outline, width: 1),

    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Palette.outline, width: 1),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Palette.outline, width: 1),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Palette.outline, width: 1),
    ),
    prefixIconConstraints: BoxConstraints(maxWidth: 40, minWidth: 40),
    suffixIconConstraints: BoxConstraints(maxWidth: 40, minWidth: 40),
    prefixIconColor: Palette.onPrimaryContainer,
    suffixIconColor: Palette.onPrimaryContainer,
  );
}
