import 'package:flutter/material.dart';
import 'package:headline/constants.dart';

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: kBackgroundColor,
      fontFamily: "Ubuntu",
      primarySwatch: Colors.grey,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: textTheme(),
      iconTheme: const IconThemeData(color: kPrimaryColor),
      appBarTheme: apparTheme(),
      dividerTheme:
          DividerThemeData(color: Colors.blueGrey.shade200, thickness: 2));
}

TextTheme textTheme() {
  return const TextTheme(
    displayMedium: TextStyle(color: kTextColor),
    displaySmall: TextStyle(color: kTextColor),
  );
}

AppBarTheme apparTheme() {
  return const AppBarTheme(
    color: kBackgroundColor,
    titleTextStyle: TextStyle(
        color: kPrimaryColor,
        fontStyle: FontStyle.italic,
        fontFamily: "NotoSerif",
        fontSize: 35),
  );
}
