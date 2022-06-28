import 'package:calm_mind/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const double spacing = 4;
const double spacing2 = spacing * 2;
const double spacing4 = spacing * 4;
const double spacing5 = spacing * 5;
const double spacing6 = spacing * 6;
const double spacing12 = spacing * 12;
const double iconSizeSmall = 24;
const double iconSize = 32;

class CalmMindThemeData {
  static final ThemeData lightThemeData = themeData();
  static final ThemeData darkThemeData = themeData();
  static ThemeData themeData() {
    return ThemeData(
      textTheme: _textTheme,
      primaryColor: CalmMindColors.ink06,
      backgroundColor: CalmMindColors.ink06,
    );
  }

  static final _textTheme = TextTheme(
    headline1: GoogleFonts.nunitoSans(
      fontSize: 56,
      fontWeight: FontWeight.w700,
      letterSpacing: -1,
    ),
    headline2: GoogleFonts.nunitoSans(
      fontSize: 40,
      fontWeight: FontWeight.w700,
      letterSpacing: -1,
    ),
    headline3: GoogleFonts.nunitoSans(
      fontSize: 32,
      fontWeight: FontWeight.w800,
      letterSpacing: -1,
    ),
    headline4: GoogleFonts.nunitoSans(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.5,
    ),
    headline5: GoogleFonts.nunitoSans(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.5,
    ),
    headline6: GoogleFonts.nunitoSans(
      fontSize: 22,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.15,
    ),
    subtitle1: GoogleFonts.nunitoSans(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
    ),
    subtitle2: GoogleFonts.nunitoSans(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
    ),
    bodyText1: GoogleFonts.nunitoSans(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
    ),
    bodyText2: GoogleFonts.nunitoSans(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
    button: GoogleFonts.nunitoSans(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.5,
    ),
    caption: GoogleFonts.nunitoSans(
      fontSize: 12,
      fontWeight: FontWeight.w800,
      letterSpacing: 0,
    ),
    overline: GoogleFonts.nunitoSans(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5,
    ),
  );
}
