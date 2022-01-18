import 'package:flutter/material.dart';
import 'size_config.dart';

const kPrimaryColor = Color(0xFF222831);
const kTextColor = Color(0xFF434656);
const kBackgroundColor = Color(0xFFE3E9EF);
const kSectionColor = Color(0xFFEEEEEE);
const kSecondaryTextColor = Color(0xFF0000A4);
const kAnimationDuration = Duration(milliseconds: 2000);

final headingStyle = TextStyle(
  color: kPrimaryColor,
  fontSize: getProportionateScreenHeight(25),
  fontFamily: "Merriweather",
);

const String appName = "Headline";
const String quote = "All the news you need and more.";

// Past your apiKey Here
const String apiKey = "";
