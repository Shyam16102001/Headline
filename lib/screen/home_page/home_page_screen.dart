import 'package:flutter/material.dart';
import 'package:headline/screen/home_page/body.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Headline"),
      ),
      body: const Body(),
    );
  }
}
