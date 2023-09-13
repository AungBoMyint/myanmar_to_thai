import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.inika(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: GoogleFonts.itim(
      color: Colors.black,
      fontSize: 20,
    ),
    displaySmall: GoogleFonts.inika(
      color: Colors.black,
      fontSize: 16,
    ),
    headlineSmall: GoogleFonts.inika(
      color: Colors.black,
      fontSize: 12,
    ),
    headlineMedium: GoogleFonts.inter(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    headlineLarge: GoogleFonts.inter(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  );
  static ThemeData lightTheme() {
    final colorCode = int.parse('050A30', radix: 16);

    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primarySwatch: MaterialColor(
        0xff050A30,
        <int, Color>{
          50: Color(colorCode),
          100: Color(colorCode),
          200: Color(colorCode),
          300: Color(colorCode),
          400: Color(colorCode),
          500: Color(colorCode),
          600: Color(colorCode),
          700: Color(colorCode),
          800: Color(colorCode),
          900: Color(colorCode),
        },
      ),
      brightness: Brightness.light,
      textTheme: lightTextTheme,
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        actionsIconTheme: const IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        titleTextStyle: lightTextTheme.displayMedium,
      ),
      cardTheme: const CardTheme(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffd6da21),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                10,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
