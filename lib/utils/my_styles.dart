import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyStyles {
  // Text colors
  static Color? primaryColor = Colors.blueGrey[900];
  static Color secondaryColor = Colors.black54;

  // Buttons Colors
  static Color? unselectedColor = Colors.blueGrey[300];
  static Color selectedColor = Colors.amber;

  // TextStyles
  static TextStyle h1Style = GoogleFonts.inter(
      fontSize: 24,
      color: primaryColor,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.5);

  static TextStyle h1StyleWhite = GoogleFonts.inter(
      fontSize: 24,
      color: Colors.white,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none,
      letterSpacing: -0.5);

  static TextStyle h2Style = GoogleFonts.inter(
      fontSize: 18, color: primaryColor, fontWeight: FontWeight.w600);

  static TextStyle h2StyleWhite = GoogleFonts.inter(
    fontSize: 18,
    color: Colors.white,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.none,
  );

  static TextStyle supportingTextStyle = GoogleFonts.lato(
    fontSize: 12,
    color: secondaryColor,
    fontWeight: FontWeight.w600,
  );

  static TextStyle supportingTextStyleWhite = GoogleFonts.lato(
    fontSize: 12,
    color: Colors.white,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.none,
  );

  static TextStyle underlineSupportingTextStyleWhite = GoogleFonts.lato(
    fontSize: 12,
    color: Colors.blue[300],
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.underline,
    decorationColor: Colors.blue,
    decorationThickness: 1.5,
  );

  // Paddings
  static EdgeInsets myDefaultVerticalElementsPadding =
      const EdgeInsets.only(top: 10, bottom: 5);
  static EdgeInsets myDefaultHorizontalAppPadding =
      const EdgeInsets.only(left: 10.0);
  static EdgeInsets myDefaultHorizontalElementsPadding =
      const EdgeInsets.only(left: 10.0);
}
