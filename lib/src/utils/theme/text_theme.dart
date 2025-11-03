import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextThemes{

  static TextTheme lightTextTheme = TextTheme(
    displayMedium: GoogleFonts.montserrat(
      color: Colors.black,
    ),
    headlineMedium: GoogleFonts.montserrat(
      color: Colors.black,
    ),
    displayLarge: GoogleFonts.poppins(
      color: Colors. black,
    ),
    bodyLarge: GoogleFonts.poppins(
      color: Colors.black,
    ),
    bodyMedium: GoogleFonts.poppins(
      color: Colors.black,
    ),
    titleLarge: GoogleFonts.poppins(
      color: Colors.black,
    ),

  );

  static TextTheme darkTextTheme = TextTheme(
    displayMedium: GoogleFonts.montserrat(
      color: Colors.white,
    ),
    headlineMedium: GoogleFonts.montserrat(
      color: Colors.white,
      ),
      displayLarge: GoogleFonts.poppins(
        color: Colors.white,
      ),
      bodyLarge: GoogleFonts.poppins(
          color: Colors.white,
      ),
      bodyMedium: GoogleFonts.poppins(
        color: Colors.white,
      ),
      titleLarge: GoogleFonts.poppins(
        color: Colors.white,
      ),
  );
}