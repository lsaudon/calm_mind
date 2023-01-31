import 'package:calm_mind/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const spacing = 4.0;
const spacing2 = spacing * 2;
const spacing4 = spacing * 4;
const spacing5 = spacing * 5;
const spacing6 = spacing * 6;
const spacing12 = spacing * 12;
const iconSizeSmall = 24.0;
const iconSize = 32.0;
const iconSize2 = 64.0;

class CalmMindThemeData {
  static final ThemeData lightThemeData = themeData();
  static final ThemeData darkThemeData = themeData();
  static ThemeData themeData() => ThemeData(
        textTheme: _textTheme,
        primaryColor: CalmMindColors.ink06,
        colorScheme: const ColorScheme.light(),
      );

  static final _textTheme = TextTheme(
    displayLarge: GoogleFonts.nunitoSans(
      fontSize: 56,
      fontWeight: FontWeight.w700,
      letterSpacing: -1,
    ),
    displayMedium: GoogleFonts.nunitoSans(
      fontSize: 40,
      fontWeight: FontWeight.w700,
      letterSpacing: -1,
    ),
    displaySmall: GoogleFonts.nunitoSans(
      fontSize: 32,
      fontWeight: FontWeight.w800,
      letterSpacing: -1,
    ),
    headlineMedium: GoogleFonts.nunitoSans(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.5,
    ),
    headlineSmall: GoogleFonts.nunitoSans(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.5,
    ),
    titleLarge: GoogleFonts.nunitoSans(
      fontSize: 22,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.15,
    ),
    titleMedium: GoogleFonts.nunitoSans(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
    ),
    titleSmall: GoogleFonts.nunitoSans(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
    ),
    bodyLarge: GoogleFonts.nunitoSans(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
    ),
    bodyMedium: GoogleFonts.nunitoSans(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
    labelLarge: GoogleFonts.nunitoSans(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.5,
    ),
    bodySmall: GoogleFonts.nunitoSans(
      fontSize: 12,
      fontWeight: FontWeight.w800,
      letterSpacing: 0,
    ),
    labelSmall: GoogleFonts.nunitoSans(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5,
    ),
  );
}
