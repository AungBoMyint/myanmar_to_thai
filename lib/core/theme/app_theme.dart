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
  );
  static ThemeData lightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: const Color(0xFFF9F2F1),
      primarySwatch: const MaterialColor(
        0xFFFF5364,
        <int, Color>{
          50: Color(0xffff98a2),
          100: Color(0xffff8793),
          200: Color(0xffff7583),
          300: Color(0xffff6474),
          400: Color(0xffff5364),
          500: Color(0xffff5364),
          600: Color(0xffe64b5a),
          700: Color(0xffcc4250),
          800: Color(0xffb33a46),
          900: Color(0xff99323c),
        },
      ),
      brightness: Brightness.light,
      textTheme: lightTextTheme,
      appBarTheme: AppBarTheme(
        elevation: 3,
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
