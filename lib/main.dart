import 'package:flutter/material.dart';
import 'package:headline/screen/home_page/home_page_screen.dart';
import 'package:headline/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Headline',
      theme: theme(),
      debugShowCheckedModeBanner: false,
      home: const HomePageScreen(),
    );
  }
}
