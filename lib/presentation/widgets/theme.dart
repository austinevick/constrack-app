import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConstrackColors {
  static final original = Color(0xff0072B8);
  static final originalLight = Color(0xff7899C5);
  static final gold = Color(0xffF1C77A);
  static final veryLightOriginal = Color(0xffeff8ff);
  static final blue = Color(0xff072693);
}

final lightTheme = ThemeData(
  appBarTheme: AppBarTheme(
    color: Colors.white,
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
        headline6: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
  ),
  canvasColor: Color(0xffF8FBFF),
  accentColor: ConstrackColors.originalLight,
  //bottomAppBarColor: DeliveryColors.veryLightGrey,
  textTheme: GoogleFonts.poppinsTextTheme().apply(
    bodyColor: Color(0xff000000),
    displayColor: Color(0xff000000),
  ),
  iconTheme: IconThemeData(color: Color(0xff000000)),
);
