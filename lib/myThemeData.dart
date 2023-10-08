import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static Color primaryColor = Color(0xFFB7935F);
  static Color whiteColor = Colors.white;
  static Color blackColor = Color(0xFF242424);
  static Color yellowColor = Color(0xFFFACC1D);
  static Color darkBluePrimaryColor = Color(0xFF141A2E);

  static ThemeData lightTheme = ThemeData(
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: primaryColor,
          onPrimary: blackColor,
          secondary: whiteColor,
          onSecondary: primaryColor,
          primaryContainer: blackColor,
          error: Colors.red,
          onError: blackColor,
          inversePrimary: whiteColor,
          background: whiteColor,
          onBackground: blackColor,
          onPrimaryContainer: blackColor,
          //cards
          surface: whiteColor,
          onSurface: primaryColor),
      iconTheme: IconThemeData(color: primaryColor, size: 30),
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
          color: const Color(0xFFFFFFFF),
        ),
        bodyLarge: GoogleFonts.elMessiri(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: blackColor,
        ),
      ),
      appBarTheme: AppBarTheme(
          color: Colors.transparent,
          centerTitle: true,
          elevation: 0.0,
          iconTheme: IconThemeData(color: primaryColor)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: blackColor,
        unselectedItemColor: whiteColor,
        backgroundColor: primaryColor,
        type: BottomNavigationBarType.shifting,
      ));

  static ThemeData darkTheme = ThemeData(
      colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primaryContainer: darkBluePrimaryColor,
          primary: darkBluePrimaryColor,
          onPrimary: whiteColor,
          secondary: blackColor,
          onSecondary: yellowColor,
          error: Colors.red,
          onError: whiteColor,
          background: darkBluePrimaryColor,
          onBackground: whiteColor,
          inversePrimary: yellowColor,
          onPrimaryContainer: yellowColor,
          //cards
          surface: darkBluePrimaryColor,
          onSurface: whiteColor),
      iconTheme: IconThemeData(color: whiteColor, size: 30),
      scaffoldBackgroundColor: Colors.transparent,
      textTheme: TextTheme(
        bodySmall: GoogleFonts.elMessiri(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: yellowColor,
        ),
        bodyMedium: GoogleFonts.elMessiri(
          fontSize: 25,
          fontWeight: FontWeight.w700,
          color: whiteColor,
        ),
        bodyLarge: GoogleFonts.elMessiri(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: blackColor,
        ),
      ),
      appBarTheme: AppBarTheme(
          color: Colors.transparent,
          centerTitle: true,
          elevation: 0.0,
          iconTheme: IconThemeData(color: whiteColor)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: yellowColor,
        unselectedItemColor: whiteColor,
        backgroundColor: darkBluePrimaryColor,
        type: BottomNavigationBarType.shifting,
      ));
}
