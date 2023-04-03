import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyStyles {
  // Text colors
  static Color? primaryColor = Colors.blueGrey[900];
  static Color secondaryColor = Colors.black54;

  // TextStyles
  static TextStyle h1Style = GoogleFonts.inter(
      fontSize: 24,
      color: primaryColor,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.5);
  static TextStyle h2Style = GoogleFonts.inter(
      fontSize: 18, color: primaryColor, fontWeight: FontWeight.w600);
  static TextStyle suppTextStyle = GoogleFonts.khula(
    fontSize: 12,
    color: secondaryColor,
    fontWeight: FontWeight.w600,
  );

  // Paddings
  static EdgeInsets myDefaultPadding =
      const EdgeInsets.only(top: 10, bottom: 5);
}
