import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeData() {
  return ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    canvasColor: Colors.black,
    textTheme: GoogleFonts.robotoTextTheme(
      const TextTheme(
          headline5: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
          bodyText1: TextStyle(color: Colors.white, fontSize: 18),
          caption: TextStyle(color: Colors.white, fontSize: 14)),
    ),
    iconTheme: IconThemeData(
      color: Colors.grey.shade500,
    ),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      centerTitle: true,
      titleTextStyle: TextStyle(
          color: Colors.white, fontWeight: FontWeight.normal, fontSize: 24),
    ),
  );
}

final headingStyle = TextStyle(
  color: Colors.white,
  fontSize: 28,
  fontWeight: FontWeight.bold,
);
