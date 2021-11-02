import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeDataLight() {
  return ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    canvasColor: Colors.white,
    textTheme: GoogleFonts.openSansTextTheme(
      const TextTheme(
          headline5: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
          bodyText1: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 16)),
    ),
    iconTheme: IconThemeData(
      color: Colors.grey.shade800,
    ),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      centerTitle: true,
      backgroundColor: Colors.black45,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 24),
    ),
  );
}

ThemeData themeData() {
  return ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    canvasColor: Colors.black,
    textTheme: GoogleFonts.openSansTextTheme(
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
