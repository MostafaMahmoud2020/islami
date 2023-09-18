import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static Color primaryColor = Color(0xFFB7935F);
  static Color whiteColor = Colors.white;
  static Color blackColor = Color(0xFF242424);

  static ThemeData lightTheme = ThemeData(
      iconTheme: IconThemeData(color: primaryColor, size: 50),
      scaffoldBackgroundColor: Colors.transparent,
      textTheme: TextTheme(
        bodySmall: GoogleFonts.elMessiri(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: blackColor,
        ),
        bodyMedium: GoogleFonts.elMessiri(
          fontSize: 25,
          fontWeight: FontWeight.w700,
          color: Color(0xFFFFFFFF),
        ),
        bodyLarge: GoogleFonts.elMessiri(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: blackColor,
        ),
      ),
      appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          iconTheme: IconThemeData(color: primaryColor)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: blackColor,
        unselectedItemColor: whiteColor,
        backgroundColor: primaryColor,
        type: BottomNavigationBarType.shifting,
      ));

  static ThemeData darkTheme = ThemeData();
}
