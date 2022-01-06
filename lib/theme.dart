import 'package:flutter/material.dart';
import 'package:headline/constants.dart';

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: kBackgroundColor,
      fontFamily: "Ubuntu",
      primarySwatch: Colors.grey,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: textTheme(),
      // inputDecorationTheme: inputDecorationTheme(),
      iconTheme: const IconThemeData(color: kPrimaryColor),
      appBarTheme: apparTheme(),
      dividerTheme:
          DividerThemeData(color: Colors.blueGrey.shade200, thickness: 2));
}

TextTheme textTheme() {
  return const TextTheme(
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
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

// InputDecorationTheme inputDecorationTheme() {
//   OutlineInputBorder outlineInputBorder = OutlineInputBorder(
//     borderRadius: BorderRadius.circular(28),
//     borderSide: const BorderSide(color: Colors.black38),
//     gapPadding: 10,
//   );
//   return InputDecorationTheme(
//     contentPadding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
//     enabledBorder: outlineInputBorder,
//     focusedBorder: outlineInputBorder,
//     border: outlineInputBorder,
//     hintStyle: const TextStyle(color: kSecondaryTextColor, fontSize: 18),
//     labelStyle: const TextStyle(color: kPrimaryColor, fontSize: 24),
//   );
// }
