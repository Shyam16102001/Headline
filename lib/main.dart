import 'package:flutter/material.dart';
import 'package:news_app/screen/home_page/home_page.dart';
import 'package:news_app/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      theme: themeData(),
      //   brightness: Brightness.light,
      // ),
      // darkTheme: ThemeData(
      //   brightness: Brightness.dark,
      // ),
      // // theme: themeDataLight(),
      // darkTheme: themeDataDark(),
      home: const HomePage(),
    );
  }
}
